import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["start", "end", "total"]
  static values = { rate: Number }

  update() {
    const start = this.startTarget.value
    const end = this.endTarget.value
    if (start && end) {
      const startDate = new Date(start)
      const endDate = new Date(end)
      const days = (endDate - startDate) / (1000 * 60 * 60 * 24)
      if (days > 0) {
        const total = days * this.rateValue
        this.totalTarget.textContent = `Total Price: $${total}`
      } else {
        this.totalTarget.textContent = ""
      }
    } else {
      this.totalTarget.textContent = ""
    }
  }
} 