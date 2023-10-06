import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper/bundle";

export default class extends Controller {
  connect() {
    // Initialize Swiper here
    const swiper = new Swiper(this.element, {
      slidesPerView: 1,
      centeredSlides: true,
      spaceBetween: 30,
      loop: true,
      effect: "coverflow",
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
