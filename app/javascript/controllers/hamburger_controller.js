import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "showButton", "hideButton" ];

  connect() {
    this.showButtonTarget.addEventListener("click", () => this.show());
    this.hideButtonTarget.addEventListener("click", () => this.hide());
    console.log("hamburger controller has been connected");
  }

  show() {
    this.menuTarget.classList.remove("invisible");
    this.showButtonTarget.classList.add("invisible");
  }

  hide() {
    this.menuTarget.classList.add("invisible");
    this.showButtonTarget.classList.remove("invisible");
  }
}
