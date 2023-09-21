import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="topic-error"
export default class extends Controller {
  static targets = ["container"]
  connect() {
    this.form = document.querySelector("form");
    this.categoryCheckboxes = this.form.querySelectorAll('input[type="checkbox"]')
    console.log(this.categoryCheckboxes);
    console.log(this.containerTarget);
  }

  checkError(event) {

    const selectedCategories = Array.from(this.categoryCheckboxes).some(checkbox => checkbox.checked);

    if (!selectedCategories) {
      event.preventDefault();
      const flashError = document.createElement('div');
      flashError.classList = "flashMessage"
      flashError.innerText = "You have to select at least one topic"
      this.containerTarget.appendChild(flashError)
      setTimeout(() => {
        this.containerTarget.removeChild(flashError);
      }, 1300);


    }
    console.log(event.target);
  }
}
