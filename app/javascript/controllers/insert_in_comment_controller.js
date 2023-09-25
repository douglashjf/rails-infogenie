import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-comment"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    // console.log('testing 123')
    // console.log("myform", this.formTarget)
    // console.log("myitems", this.itemsTarget)
    // console.log("mycontroller", this.element)
  }

  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    console.log(url)
    const options = {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    }
    console.log(options)
    fetch(url, options)
    .then(response => response.json())
    .then((data) =>{
      console.log(data)
    })
  }
}
