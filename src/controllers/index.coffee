app = require './../../config/app'

app.get '/', (req, res, next) ->
  res.send 'Hello from cheat\n'
