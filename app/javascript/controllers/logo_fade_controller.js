import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="logo-fade"
export default class extends Controller {
  connect() {

  }

  fade(e) {
    e.preventDefault();
    this.element.classList.add('fade-out')
    this.element.classList.add('pe-none')
    document.querySelector('video').play();
  }

}
