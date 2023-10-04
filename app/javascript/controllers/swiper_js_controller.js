import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper/bundle'


// Connects to data-controller="swiper-js"
export default class extends Controller {

  connect() {
    new Swiper(this.element, {
      slidesperView: 1,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });


  }
}
