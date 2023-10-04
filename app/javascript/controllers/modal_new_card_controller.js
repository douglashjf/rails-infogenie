import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-new-card"
export default class extends Controller {
  static targets =["button","modalContent", "modal"]
  connect() {

  }

  fetch(e) {
    e.preventDefault();;
    const url = this.buttonTarget.getAttribute("data-href")
    const modal = new bootstrap.Modal(this.modalTarget)

    fetch(url, {headers: {"Accept": "text/plain"}})
      // send via AJAX: pass the response as text, with data we get back we will look for target we gave to partial
      .then(response => response.text())
      .then((data) => {
        // this.target.outerHTML = data we get back (the 3 new articles we've fetched) -- as we want to replace entire partial
        this.modalContentTarget.innerHTML = data;
        console.log(this.modalContentTarget.innerHTML);
        modal.show();
      })
  }


}
