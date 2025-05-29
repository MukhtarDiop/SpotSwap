import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static targets = ["startDate", "endDate"]
  static values = { bookedDates: Array }

  connect() {
    flatpickr(this.startDateTarget, {
      minDate: "today",
      disable: this.bookedDatesValue,
      onChange: this.updateEndDateMin.bind(this)
    })
    flatpickr(this.endDateTarget, {
      minDate: "today",
      disable: this.bookedDatesValue
    })
  }

  updateEndDateMin(selectedDates) {
    if (selectedDates.length > 0) {
      this.endDateTarget._flatpickr.set("minDate", selectedDates[0])
    }
  }
} 