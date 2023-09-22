import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selected-topics"
export default class extends Controller {
  static targets = ["container"]
  connect() {
    // my explanation: this is to make sure that previous selection remains saved without having to reselect
    this.cards = document.querySelectorAll('.category-card')

    const selected = document.querySelectorAll('.category-selected');
    console.log(selected);

    Array.from(selected).forEach(node =>
      node.firstElementChild.value = ''
    )

  }

  // to toggle the selection, and then later on negate the hidden values to '' for selected cards
  toggleCategory (e) {
    e.preventDefault();
    const card = e.currentTarget;
    card.classList.toggle("category-selected");


    const categoryId = card.getAttribute('data-category-id');
    const categoryIdInput = card.querySelector('input[type="hidden"]');

    if (categoryIdInput) {
      categoryIdInput.value = card.classList.contains('category-selected') ? '' : categoryId;
    }
  }

  // error pop up message when no cards are selected
  validate(event){
    const selectedCategories = Array.from(this.cards).some(card => card.classList.contains("category-selected"));

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
  }
}
