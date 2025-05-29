import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "hint"]

  validate() {
    const selected = new Date(this.startDateTarget.value)
    const today = new Date()
    today.setHours(0,0,0,0)
    if (selected < today) {
      this.hintTarget.style.display = "inline"
    } else {
      this.hintTarget.style.display = "none"
    }
  }

  updateEndDateMin() {
    if (this.startDateTarget.value) {
      this.endDateTarget.min = this.startDateTarget.value
      // Optionally, clear end date if it's before the new min
      if (this.endDateTarget.value && this.endDateTarget.value < this.startDateTarget.value) {
        this.endDateTarget.value = ""
      }
    }
  }
} 