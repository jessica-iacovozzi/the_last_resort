import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="spell-status"
export default class extends Controller {
  connect() {
  }

  updateStatus(event) {
    console.log(event.params)
  }

    // Accept or decline a requested spell
  const status = document.getElementById('status');
  const accept = document.getElementById('Accept');
  const decline = document.getElementById('Decline');

  accept.addEventListener("click", (event) => {
    let data = status.innerText;
    data = 'Accepted';
    status.innerHTML = data;
  });

  decline.addEventListener("click", (event) => {
    let data = status.innerText;
    data = 'Declined';
    status.innerHTML = data;
  });
}
