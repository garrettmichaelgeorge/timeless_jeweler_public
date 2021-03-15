const { environment } = require('@rails/webpacker')
const { ProvidePlugin } = require('webpack')

// Set nested object prop using path notation
environment.config.set('output.filename', '[name].js')

environment.plugins.append('Provide',
  new ProvidePlugin({
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable'
  })
)

module.exports = environment
