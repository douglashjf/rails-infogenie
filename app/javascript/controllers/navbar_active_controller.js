import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-active"
export default class extends Controller {
  static targets = ['home', 'create', 'favourite', 'profile']
  connect() {
    const currentURL = window.location.pathname;
    if (currentURL === this.homeTarget.getAttribute("href")){
        this.homeTarget.classList.add('is-active');
    }

    if (currentURL === this.createTarget.getAttribute("href")){
      this.createTarget.classList.add('is-active');
    }

    if (currentURL === this.favouriteTarget.getAttribute("href")){
      this.favouriteTarget.classList.add('is-active');
    }

    if (currentURL === this.profileTarget.getAttribute("href")){
      this.profileTarget.classList.add('is-active');
    }
  }
}
