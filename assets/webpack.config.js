const path = require('path')
const webpack = require('webpack')

module.exports = {
  entry: {
    'app': ['./js/app.js', './css/app.css']
  },
  output: {
    path: path.resolve(__dirname, '../priv/static/'),
    filename: 'js/[name].js'
  }
}
