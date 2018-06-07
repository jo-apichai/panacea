const path = require('path')
const webpack = require('webpack')

const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const devMode = process.env.NODE_ENV !== 'production'


module.exports = {
  entry: {
    'app': ['./js/app.js', './css/app.scss']
  },
  output: {
    path: path.resolve(__dirname, '../priv/static/'),
    filename: 'js/[name].js'
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: devMode ? 'css/[name].css' : 'css/[name].[hash].css',
      chunkFilename: devMode ? 'css/[id].css' : 'css/[id].[hash].css'
    })
  ],
  module: {
    rules: [
      {
        test: /\.s?[ac]ss$/,
        use: [
          MiniCssExtractPlugin.loader,
          'css-loader',
          'sass-loader'
        ]
      }
    ]
  }
}
