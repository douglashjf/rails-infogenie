import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites-button"
export default class extends Controller {
  static targets = ['favourites', 'favouritesContainer', 'favouriteIcon']
  connect() {
  }

  toggle() {
    const flashAdd = document.createElement('div');
    flashAdd.className = 'flash-message';
    flashAdd.innerText = 'Added to Favourites'
    const flashRem = document.createElement('div');
    flashRem.className = 'flash-message';
    flashRem.innerText = 'Removed from Favourites'

    if (this.favouriteIconTarget.classList.contains('fa-solid')){
      console.log('Button Works')
      this.favouriteIconTarget.classList.remove('fa-solid');
      this.favouriteIconTarget.classList.add('fa-regular');
      this.favouritesContainerTarget.appendChild(flashRem);
      setTimeout(() => {
        this.favouritesContainerTarget.removeChild(flashRem);
      }, 1500);
    } else {
      console.log('button works');
      this.favouriteIconTarget.classList.remove('fa-regular');
      this.favouriteIconTarget.classList.add('fa-solid');

      this.favouritesContainerTarget.appendChild(flashAdd);
      setTimeout(() => {
        this.favouritesContainerTarget.removeChild(flashAdd);
      }, 1500);
    }
  }
}
