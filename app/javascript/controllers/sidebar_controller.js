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

  showSidebar(e){
    e.preventDefault()
    const sidebar = document.getElementById("sidebar")
    const btn_sidebar = document.getElementById("show-sidebar")
    const bk_menu = document.getElementById("bk-menu")

    sidebar.classList.toggle("left-[-300px]")
    btn_sidebar.classList.toggle("hidden")
    bk_menu.classList.toggle("hidden")
  }
}
