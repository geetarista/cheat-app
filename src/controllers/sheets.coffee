app = require './../../config/app'
Sheet = app.db.model 'Sheet'

app.get '/sheets', (req, res, next) ->
  Sheet.find {}, (err, sheets) ->
    return next err if err
    sheet_list = "#{sheet.name}\n" for sheet in sheets
    res.send sheet_list

app.post '/sheets', (req, res, next) ->
  console.log req.body
  sheet = new Sheet req.body
  console.log sheet
  sheet.save (err) ->
    if err
      res.send "Unable to save sheet"
    else
      res.send "Sheet #{sheet.name} saved"

app.get '/sheets/:name', (req, res, next) ->
  if req.params.name
    Sheet.findOne { name: req.params.name }, (err, sheet) ->
      res.send sheet.body
