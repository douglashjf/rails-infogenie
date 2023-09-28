import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="email-test"
export default class extends Controller {
  connect() {
    console.log('test');
  }

  test() {
    fetch('/cron', {
      method: 'GET',
    })
      .then(response => {
        if (response.ok) {
          console.log('Request to /cron was successful.');
        } else {
          console.error('Request to /cron failed.');
        }
      })
      .catch(error => {
        console.error('An error occurred:', error);
      });
  }
}
