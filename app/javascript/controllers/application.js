import { Application } from "@hotwired/stimulus"
// import feather from "feather-icons"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }


document.addEventListener('turbo:load', () => {
    feather.replace()
})