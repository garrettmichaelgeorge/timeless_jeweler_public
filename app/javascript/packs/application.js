import 'core-js/stable'
import 'regenerator-runtime/runtime'

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'

// Theme Dependencies
import 'jquery'
import 'popper.js'
import 'bootstrap'

// Theme
// import 'dashkit/src/assets/js/dashkit'

// Custom
import initApplication from 'src/js/main'

// To decrease page load time, load js files asynchronously
// by importing them in the following file:
// import 'src/plugins'

// SCSS
import 'src/assets/scss/application'

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', initApplication)

import "controllers"
