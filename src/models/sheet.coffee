mongoose = require 'mongoose'
env = require './../../config/env'

validatePresence = (value) ->
  value && value.length > 0

SheetSchema = module.exports = new mongoose.Schema
  name:
    type: String
    validate: [validatePresence, 'a name is required']
  body:
    type: String
    validate: [validatePresence, 'a body is required']

mongoose.model 'Sheet', SheetSchema
