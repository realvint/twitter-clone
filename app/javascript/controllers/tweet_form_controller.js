import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:submit-end', () => {
      Array.from(document.getElementsByClassName('close-modal-btn')).forEach((btn) => {
        btn.click()
      })
      this.element.reset()
    })
  }
}
