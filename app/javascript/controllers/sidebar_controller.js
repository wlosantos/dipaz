import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    console.log("Sidebar controller connected")
  }

  toggleSubmenu(event) {
    event.preventDefault()
    const submenu = event.target.nextElementSibling
    submenu.classList.toggle("hidden")
  }
}
