import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="loading-page"
export default class extends Controller {
  static targets = ["loadingPage", "form"];
  connect() {
    console.log("hi");
    console.log(this.loadingPageTarget);
    console.log(this.formTarget);
  }

  toggleLoadingPage(e) {
    e.preventDefault();
    this.loadingPageTarget.classList.remove("d-none");

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  }
}
