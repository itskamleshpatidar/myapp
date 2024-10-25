# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

# Pin Bootstrap and Popper.js manually in importmap.rb
pin "bootstrap", to: "https://unpkg.com/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
pin "@popperjs/core", to: "https://unpkg.com/@popperjs/core@2.11.8/dist/umd/popper.min.js"

# pin "axios", to: "axios/dist/axios.min.js"
pin "feather", to: "feather-icons.js"
# pin "axios" # @1.7.7
# pin "#lib/adapters/http.js", to: "#lib--adapters--http.js.js" # @1.7.7
# pin "#lib/platform/node/classes/FormData.js", to: "#lib--platform--node--classes--FormData.js.js" # @1.7.7
# pin "#lib/platform/node/index.js", to: "#lib--platform--node--index.js.js" # @1.7.7
pin "axios", to: "https://cdn.jsdelivr.net/npm/axios@1.7.7/dist/axios.min.js"
pin "chart.js" # @2.9.4
