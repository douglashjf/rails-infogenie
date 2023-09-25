import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-news"
export default class extends Controller {
  static values = { cardId: Number };

  connect() {
    }

  // create refreshArticles action - which finds a card based on id (stimulus values)
  refreshArticles() {
    const url = `cards/${this.cardIdValue}/refresh_articles`
    fetch(url, {headers: {"Accept": "text/plain"}})
      // send via AJAX: pass the response as text, with data we get back we will look for target we gave to partial
      .then(response => response.text())
      .then((data) => {
        // this.target.outerHTML = data we get back (the 3 new articles we've fetched) -- as we want to replace entire partial
        this.listTarget.outerHTML = data
      })
    }
}

// controller should fetch the sample of 3, then feed it into the show page
// show.html.erb
  // wrap line 62 inside partial, give it a target
  // refreshArticles calls a route (cards/cards id) that goes to a controller
  // Controller fetches 3 articles from the card
  // route will match a certain controller

  // params id - find the sample of 3 - and render back a partial
  // give it the 3 articles as a string



  // lectures to go over: design to code - response in text / AJAX in rails - response in JSON
