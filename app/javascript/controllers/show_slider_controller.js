import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-slider"
export default class extends Controller {
  static targets = ["slides","dots"]
  connect() {
    console.log(this.slidesTargets, this.dotsTarget);
    this.dotsTarget.classList.add("active")
  }

  _curSlide = 0;
  _maxSlide = this.slidesTargets.length - 1 ;

  slideRight() {
    if (this._curSlide === this._maxSlide) {
      this._curSlide = 0;
    } else {
      this._curSlide++;
    }
    this.dotsTargets.forEach(dot => dot.classList.remove("active"));
    this.slidesTargets.forEach((s,i) => s.style.transform = `translateX(${110 * (i - this._curSlide)}%)`)
    document.querySelector(`.dots_dot[data-slide="${this._curSlide}"]`).classList.add("active");

  }

  slideLeft() {
    if (this._curSlide === 0) {
      this._curSlide = this._maxSlide;
    } else {
      this._curSlide--;
    }
    this.dotsTargets.forEach(dot => dot.classList.remove("active"));
    this.slidesTargets.forEach((s,i) => s.style.transform = `translateX(${110 * (i - this._curSlide)}%)`)
    document.querySelector(`.dots_dot[data-slide="${this._curSlide}"]`).classList.add("active");
  }

}
