const { environment } = require('@rails/webpacker')
const { ProvidePlugin } = require('webpack')

// Set nested object prop using path notation
environment.config.set('output.filename', '[name].js')

environment.plugins.append('Provide',
  new ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable'
  })
)

// environment.config.set('resolve.alias', {
//   jquery: 'jquery/src/jquery'
// })

module.exports = environment
