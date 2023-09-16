import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourites-button"
export default class extends Controller {
  static targets = ['favourites', 'favouritesContainer']
  connect() {
    console.log('testtest test');
  }

  toggle() {
    const flashAdd = document.createElement('div');
    flashAdd.className = 'flash-message';
    flashAdd.innerText = 'Added to Favourites'
    const flashRem = document.createElement('div');
    flashRem.className = 'flash-message';
    flashRem.innerText = 'Removed from Favourites'


    this.favouritesTarget.classList.toggle('is-favourites');
    if (this.favouritesTarget.innerText === ('➕ Add to Favourites')){
      this.favouritesTarget.innerText = ('➖ Remove from Favourites');
      this.favouritesContainerTarget.appendChild(flashAdd);
      setTimeout(() => {
        this.favouritesContainerTarget.removeChild(flashAdd);
      }, 1500);
    } else {
      this.favouritesTarget.innerText = ('➕ Add to Favourites')
      this.favouritesContainerTarget.appendChild(flashRem);
      setTimeout(() => {
        this.favouritesContainerTarget.removeChild(flashRem);
      }, 1500);
    }
  }
}
