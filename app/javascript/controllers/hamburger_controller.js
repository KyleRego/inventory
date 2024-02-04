import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu", "showButton", "hideButton" ];

  connect() {
    this.showButtonTarget.addEventListener("click", () => this.show());
    this.hideButtonTarget.addEventListener("click", () => this.hide());
    console.log("hamburger controller has been connected");
  }

  show() {
    this.menuTarget.classList.remove("display-none");
    this.showButtonTarget.classList.add("display-none");
    this.hideButtonTarget.classList.remove("display-none");
  }

  hide() {
    this.menuTarget.classList.add("display-none");
    this.showButtonTarget.classList.remove("display-none");
    this.hideButtonTarget.classList.add("display-none");
  }
}
