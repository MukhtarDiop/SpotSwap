import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

connect() {
  console.log("Map controller connected ✅");

  mapboxgl.accessToken = this.apiKeyValue;

  this.map = new mapboxgl.Map({
    container: this.element,
    style: "mapbox://styles/mapbox/streets-v11"
  });

  this.map.on("load", () => {
    console.log("Mapbox loaded ✅");
    this.addClusteredMarkers();
  });
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

    // cluster circles
    this.map.addLayer({
      id: "clusters",
      type: "circle",
      source: "spots",
      filter: ["has", "point_count"],
      paint: {
          "circle-color": "#fff", // gris très foncé
          "text-color": "#ffffff",  // ✅ NOIR
          "circle-radius": [
            "step",
            ["get", "point_count"],
            20, 5,
            30, 10,
            40
          ],
          "circle-stroke-width": 1,
          "circle-stroke-color": "#ffffff" // bord blanc
        }
    })

    // cluster count
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

    // unclustered points
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

    // popup on click
    this.map.on("click", "unclustered-point", (e) => {
      const coordinates = e.features[0].geometry.coordinates.slice()
      const html = e.features[0].properties.infoWindow

      new mapboxgl.Popup()
        .setLngLat(coordinates)
        .setHTML(html)
        .addTo(this.map)
    })
  }
}
