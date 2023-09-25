import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading-page"
export default class extends Controller {
  static targets = ["loadingPage", "form" ]
  connect() {
    console.log('hi');
    console.log(this.loadingPageTarget);
    console.log(this.formTarget);
  }

  toggleLoadingPage(e) {
    e.preventDefault();
    this.loadingPageTarget.classList.remove('d-none');
    this.formTarget.submit();
  }
}
