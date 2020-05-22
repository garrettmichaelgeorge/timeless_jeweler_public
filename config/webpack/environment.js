const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// Set nested object prop using path notation
environment.config.set('output.filename', '[name].js')


// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable',
  })
  )
  
module.exports = environment
