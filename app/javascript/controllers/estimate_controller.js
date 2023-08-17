import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="estimate"
export default class extends Controller {
  static targets = ['estimateBtn', 'start', 'end']

  static values = {
    price: String
  }

  connect() {
    console.log('hello there');
  }

  total(event){
    event.preventDefault()
    const price = this.#calculate_price()

    if(price){
      this.estimateBtnTarget.classList.add('p-3', 'my-3')
      this.estimateBtnTarget.innerHTML =
      `<h5>Your estimate price for this booking</h5>
        <p>Total-------------------<strong>${price}円</strong></p>`
    }
  }

  #calculate_price(){
    const time = new Date(this.endTarget.value) - new Date(this.startTarget.value)
    const days = time / (3600000 * 24)
    return days * parseInt(this.priceValue)
  }
}
