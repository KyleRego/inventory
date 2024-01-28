import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ];

  connect() {
    console.log("hamburger controller has been connected");
  }

  show() {
    this.menuTarget.hidden = false;
  }

  hide() {
    this.menuTarget.hidden = true;
  }
}
