import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="ellipsis-options"
export default class extends Controller {
  static targets = ["dropdown"]
  connect() {
    console.log(this.dropdownTarget);
  }

  openDropdown() {

    this.dropdownTarget.classList.remove('d-none');
  }
}
