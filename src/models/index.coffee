util = require 'util'
mongoose = require 'mongoose'
require('mongoose-types').loadTypes mongoose
fs = require 'fs'

models = fs.readdirSync(__dirname)

for model in models
  require __dirname + "/" + model.split(".coffee")[0] unless model is 'index.coffee'

module.exports = (url) ->
  util.log 'connecting to ' + url.cyan
  mongoose.connect url, (err) -> throw Error err if err
