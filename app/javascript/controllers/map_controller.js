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

    // Add geocoder control (search box)
    this.map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
      })
    )

    this.map.on("load", () => {
      console.log("Mapbox loaded ✅")
      this.addClusteredMarkers()

      // Optionally, if you want to fit map bounds to markers:
      this.fitMapToMarkers()
    })
  }

  addClusteredMarkers() {
    const geojson = {
      type: "FeatureCollection",
      features: this.markersValue.map(marker => ({
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

    this.map.addSource("spots", {
      type: "geojson",
      data: geojson,
      cluster: true,
      clusterMaxZoom: 14,
      clusterRadius: 50
    })

    // Cluster circles
    this.map.addLayer({
      id: "clusters",
      type: "circle",
      source: "spots",
      filter: ["has", "point_count"],
      paint: {
        "circle-color": "#fff",
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

    // Cluster count labels
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

    // Unclustered points
    this.map.addLayer({
      id: "unclustered-point",
      type: "circle",
      source: "spots",
      filter: ["!", ["has", "point_count"]],
      paint: {
        "circle-color": "#000000",
        "circle-radius": 6,
        "circle-stroke-width": 2,
        "circle-stroke-color": "#fff"
      }
    })

    // Popup on click for unclustered points
    this.map.on("click", "unclustered-point", (e) => {
      const coordinates = e.features[0].geometry.coordinates.slice()
      const html = e.features[0].properties.infoWindow

      new mapboxgl.Popup()
        .setLngLat(coordinates)
        .setHTML(html)
        .addTo(this.map)
    })

    // Change cursor to pointer on hover
    this.map.on("mouseenter", "unclustered-point", () => {
      this.map.getCanvas().style.cursor = "pointer"
    })

    this.map.on("mouseleave", "unclustered-point", () => {
      this.map.getCanvas().style.cursor = ""
    })
  }

  fitMapToMarkers() {
    if (this.markersValue.length === 0) return

    const bounds = new mapboxgl.LngLatBounds()

    this.markersValue.forEach(marker => {
      bounds.extend([marker.lng, marker.lat])
    })

    this.map.fitBounds(bounds, {
      padding: 50,
      maxZoom: 15,
      duration: 1000
    })
  }
}
