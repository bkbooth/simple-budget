'use strict';

const path = require('path');
const webpack = require('webpack');
const merge = require('webpack-merge');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const UglifyJsPlugin = require('webpack/lib/optimize/UglifyJsPlugin');

module.exports = function(options) {
  const commonConfig = require('./webpack.common')(options);

  return merge(commonConfig, {
    devtool: 'source-map',

    module: {
      rules: [
        {
          test: /\.s?css$/,
          loader: ExtractTextPlugin.extract({
            fallback: 'style-loader',
            use: [
              { loader: 'postcss-loader', options: { sourceMap: true, config: { path: 'config/postcss.config.js' } } },
              { loader: 'sass-loader', options: { sourceMap: true } },
            ],
          }),
        },
      ]
    },

    plugins: [
      new CopyWebpackPlugin([
        {
          from: path.join(options.paths.src, 'img'),
          to: 'img',
        },
      ]),

      new ExtractTextPlugin({
        filename: '[name].[hash].bundle.css',
        allChunks: true,
      }),

      new UglifyJsPlugin({
        minimize: true,
        compressor: { warnings: false },
        mangle: true,
      }),
    ]
  });
};
