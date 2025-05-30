import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "results"]
    connect() {
    console.log("✅ Filter controller connected")
  }
  search(event) {
    event.preventDefault()

    fetch(this.formTarget.action + "?" + new URLSearchParams(new FormData(this.formTarget)), {
        headers: {
        Accept: "text/vnd.turbo-stream.html"
      }
    })
      .then(response => response.text())
      .then(html => {
        console.log(`je suppprime`)
        this.resultsTarget.innerHTML = html
      })
  }
}