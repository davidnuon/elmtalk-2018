const path = require('path');

module.exports = {
  mode: 'development',
  entry: './src/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },
  devServer: {
    inline: true,
    port: 9001,
    contentBase: '/',

    output: {
       path: path.resolve(__dirname, 'serve'),
       filename: 'bundle.js'
    }
  },
  module: {
    rules: [
    {
      test: /\.scss$/,
      use:  ['style-loader', 'css-loader', 'sass-loader']
    },
    {
      test: /\.css$/,
      use: [ 'style-loader', 'css-loader' ]
    },
    {
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: 'elm-webpack-loader'
    },
    {
      test: /\.js$/,
      exclude: /(node_modules|bower_components)/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['babel-preset-env']
        }
      }
    }
    ]
  }
};

