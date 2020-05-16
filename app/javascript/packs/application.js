// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import "core-js/stable"
import "regenerator-runtime/runtime"

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
require("channels")
import "jquery"
import "bootstrap/dist/js/bootstrap";
import "admin-lte/build/js/AdminLTE"
/**
 * 
 * Refers to app/javascript/stylesheets/application.scss (or application.css)
 * Note that we don't need to preface this path with "app/javascript" due to the `source_path` config set in config/webpacker.yml. Magical!
 * The file extension can be left off due to the `extensions` config in config/webpacker.yml.
 */
import "../src/stylesheets/application" // i.e. app/javascript/stylesheets/application.scss

$(function () {
  console.log('Hello World from Webpacker');
});

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
