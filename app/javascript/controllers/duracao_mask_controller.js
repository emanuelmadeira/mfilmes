// app/javascript/controllers/duracao_mask_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTarget.addEventListener('input', this.formatDuracao.bind(this))
  }

  formatDuracao(event) {
    let value = event.target.value.replace(/\D/g, '') // Remove tudo que não é número
    let formattedValue = ''

    if (value.length > 0) {
      // Adiciona 'h' após as horas (primeiros 1-3 dígitos)
      if (value.length <= 3) {
        formattedValue = value + 'h'
      } else {
        // Separa horas e minutos
        const horas = value.substring(0, value.length - 2)
        const minutos = value.substring(value.length - 2, value.length - 1)
        
        formattedValue = horas + 'h' + minutos + 'm'
      }
    }

    event.target.value = formattedValue
  }

  // Validação antes do submit
  validate(event) {
    const value = event.target.value
    const pattern = /^[0-9]{1,3}h[0-9]{1,2}m$/
    
    if (value && !pattern.test(value)) {
      event.preventDefault()
      alert('Por favor, use o formato correto: 2h28m (horas e minutos)')
      event.target.focus()
    }
  }
}