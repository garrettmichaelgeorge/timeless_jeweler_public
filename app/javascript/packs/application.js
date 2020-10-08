// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'core-js/stable'
import 'regenerator-runtime/runtime'

// Theme Dependencies
import 'jquery'
import 'popper.js'
import 'bootstrap'

// Theme
import 'dashkit/src/assets/js/dashkit'

// Custom
import 'src/js/scripts'

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
