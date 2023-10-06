import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="scroll-lamp"
export default class extends Controller {
  static targets = ["lamp","message"]
  connect() {
    console.log("scroll loaded");
    console.log(this.lampTarget);
    console.log(this.messageTarget);

    const obsOptions = {
      root: null,
      threshold: 0.9,
    }



    const obsCallback = function (entries) {
      const [entry] = entries;
      console.log(entry);
      const lamp = document.querySelector('.landing-lamp')
      const call = document.querySelector('.landing-call')
      const message = document.querySelector('.landing-message')
      if (!entry.isIntersecting) {
        lamp.classList.add('opacity-0')
        call.classList.add('opacity-0')
        message.classList.add('opacity-0')
      }
      else {
        lamp.classList.remove('opacity-0');
        lamp.classList.add('fade-in');
        call.classList.remove('opacity-0');
        call.classList.add('fade-in1');
        message.classList.remove('opacity-0');
        message.classList.add('fade-in1');
      }
    }

    const observer = new IntersectionObserver(obsCallback, obsOptions);
    observer.observe(this.messageTarget)
  }


}
