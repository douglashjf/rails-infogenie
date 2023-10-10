import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

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
    window.scrollTo(0, 0);

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.id) {
          this.channel = createConsumer().subscriptions.create(
            { channel: "CardChannel", id: data.id },
            {
              received: (data) => {
                if (data.message === "done" && data.id)
                  window.location.href = `/cards/${data.id}`;
              },
            }
          );
          console.log(`Subscribed to the card channel with the id ${data.id}.`);
        }
      });
  }
}
