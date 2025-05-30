import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log("Map controller connected ✅")

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v11"
    })

    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
      })
    )

    this.map.on("load", () => {
      console.log("Mapbox loaded ✅")
      this.#addClusteredMarkers()
      this.#fitMapToMarkers()
    })
    window.addEventListener("filter:markers", event => {
      const newMarkers = event.detail.markers
      this.#updateMarkers(newMarkers)
    })
  }

  #addClusteredMarkers() {
    const geojson = this.#buildGeoJSON(this.markersValue)

    this.map.addSource("spots", {
      type: "geojson",
      data: geojson,
      cluster: true,
      clusterMaxZoom: 14,
      clusterRadius: 50
    })

    this.#addClusterLayers()
  }

  #addClusterLayers() {
    if (!this.map.getLayer("clusters")) {
      this.map.addLayer({
        id: "clusters",
        type: "circle",
        source: "spots",
        filter: ["has", "point_count"],
        paint: {
          "circle-color": "#000000",
          "circle-radius": [
            "step",
            ["get", "point_count"],
            20, 5,
            30, 10,
            40
          ],
          "circle-stroke-width": 1,
          "circle-stroke-color": "#ffffff"
        }
      })
    }

    if (!this.map.getLayer("cluster-count")) {
      this.map.addLayer({
        id: "cluster-count",
        type: "symbol",
        source: "spots",
        filter: ["has", "point_count"],
        layout: {
          "text-field": "{point_count_abbreviated}",
          "text-font": ["DIN Offc Pro Medium", "Arial Unicode MS Bold"],
          "text-size": 14
        }
      })
    }

    if (!this.map.getLayer("unclustered-point")) {
      this.map.addLayer({
        id: "unclustered-point",
        type: "circle",
        source: "spots",
        filter: ["!", ["has", "point_count"]],
        paint: {
          "circle-color": "#000000",
          "circle-radius": 6,
          "circle-stroke-width": 2,
          "circle-stroke-color": "#ffffff"
        }
      })
      this.map.on("click", "unclustered-point", (e) => {
        const coordinates = e.features[0].geometry.coordinates.slice()
        const html = e.features[0].properties.infoWindow

        new mapboxgl.Popup()
          .setLngLat(coordinates)
          .setHTML(html)
          .addTo(this.map)
      })
      this.map.on("click", "clusters", (e) => {
        const features = this.map.queryRenderedFeatures(e.point, {
          layers: ["clusters"]
        })
        const clusterId = features[0].properties.cluster_id
        this.map.getSource("spots").getClusterExpansionZoom(clusterId, (err, zoom) => {
          if (err) return

          this.map.easeTo({
            center: features[0].geometry.coordinates,
            zoom: zoom
          })
        })
      })
    }
  }

  #buildGeoJSON(markers) {
    return {
      type: "FeatureCollection",
      features: markers.map(marker => ({
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [marker.lng, marker.lat]
        },
        properties: {
          infoWindow: marker.info_window_html
        }
      }))
    }
  }

  #updateMarkers(newMarkers) {
    if (!this.map.getSource("spots")) {
      this.markersValue = newMarkers
      this.#addClusteredMarkers()
    } else {
      const newGeoJSON = this.#buildGeoJSON(newMarkers)
      this.map.getSource("spots").setData(newGeoJSON)
      this.#fitMapToMarkers(newMarkers)
    }
  }

  #fitMapToMarkers(markers = this.markersValue) {
    if (markers.length === 0) return

    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]))

    if (markers.length === 1) {
      const m = markers[0]
      const offset = 0.01
      bounds.extend([m.lng + offset, m.lat + offset])
      bounds.extend([m.lng - offset, m.lat - offset])
    }

    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1000 })
  }
}
