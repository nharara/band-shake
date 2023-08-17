import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      // minTime: "16:00",
      // maxTime: "22:00",
      altInput: true,
      minDate: new Date().fp_incr(1),
      altFormat: "F j, Y, H:i",
      dateFormat: "Y-m-d H:i"
    });
  }
}
