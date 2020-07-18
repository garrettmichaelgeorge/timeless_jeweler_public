// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import "core-js/stable"
import "regenerator-runtime/runtime"

// Libraries (Theme Dependencies)
import "popper.js";
import tippy, {createSingleton} from 'tippy.js';
// import "tippy.js/dist/tippy.umd"
import "bootstrap"

// Theme
import "dashkit/src/assets/js/dashkit"

// Custom
import "src/js/tippy_scripts"
import "src/js/select2_scripts"
import "src/js/people_form"

// To decrease page load time, load js files asynchronously by placing them in the following file:
// import "src/plugins"

// SCSS
import "src/assets/scss/application"
