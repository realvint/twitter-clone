import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tweet-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:submit-end', () => {
      document.getElementById('close-modal-btn').click()
      this.element.reset()
    })
  }
}
