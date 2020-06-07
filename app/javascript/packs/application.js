// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "core-js/stable"
import "regenerator-runtime/runtime"

// require("@rails/ujs").start()
import Rails from "@rails/ujs"
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Libraries (Theme Dependencies)
import "jquery/dist/jquery.slim.min"
import tippy from "tippy.js"
import flatpickr from "dashkit/dist/assets/libs/flatpickr/dist/flatpickr.min"
import "dashkit/dist/assets/libs/select2/dist/js/select2.full.min.js"
// import "reports_kit/assets/javascripts/reports_kit/application.js"
import "src/plugins"

// Custom
import "src/js/tippyScripts"

/**
 * 
 * Refers to app/javascript/stylesheets/application.scss (or application.css)
 * Note that we don't need to preface this path with "app/javascript" due to the `source_path` config set in config/webpacker.yml. Magical!
 * The file extension can be left off due to the `extensions` config in config/webpacker.yml.
 */
import "src/assets/scss/application"

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// createPopper(reference, popper, options);

Rails.start()