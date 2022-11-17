import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
	static values = {
		markers: Array,
		apiKey: String,
	};

	connect() {
		mapboxgl.accessToken = this.apiKeyValue;

		this.map = new mapboxgl.Map({
			container: this.element,
			style: "mapbox://styles/mapbox/streets-v10",
		});

		this.#addMarkersToMap();
		this.#fitMapToMarkers();

		this.map.addControl(
			new MapboxGeocoder({
				accessToken: mapboxgl.accessToken,
				mapboxgl: mapboxgl,
			})
		);
	}

	#addMarkersToMap() {
		this.markersValue.forEach((marker) => {
			const popup = new mapboxgl.Popup().setHTML(marker.info_window);

			const customMarker = document.createElement("div");
			customMarker.className = "marker";
			customMarker.style.backgroundImage = `url('${marker.image_url}')`;
			customMarker.style.backgroundSize = "contain";
			customMarker.style.backgroundRepeat = "no-repeat";
			customMarker.style.width = "55px";
			customMarker.style.height = "55px";

			new mapboxgl.Marker(customMarker)
				.setLngLat([marker.lng, marker.lat])
				.setPopup(popup)
				.addTo(this.map);
		});
	}

	#fitMapToMarkers() {
		const bounds = new mapboxgl.LngLatBounds();
		this.markersValue.forEach((marker) => {
			console.log(marker);
			bounds.extend([marker.lng, marker.lat]);
		});
		this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 500 });
	}
}