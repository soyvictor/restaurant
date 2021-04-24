import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'count' ];
  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    // console.log('hello!');
    // console.log(this.countTarget);
  }

  refresh() {
    console.log("refreshed!");
    const navCounter = document.querySelector(".shopping-cart-count-icon");
    setTimeout(
      () => fetch('/user_items', { headers: { accept: "application/json" } })
            .then(response => response.json())
            .then((data) => {
              console.log(data.user_items);
              this.countTarget.innerHTML = data.user_items;
              navCounter.innerHTML = data.user_items;
            })
      , 1100);
  }
}
