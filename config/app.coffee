express = require 'express'
auth = require 'mongoose-auth'
env = require './env'
port = env.port
{EventEmitter} = require 'events'
colors = require 'colors'

app = module.exports = express.createServer()

app.paths = {
  public: __dirname + '/../public',
  views: __dirname + '/../views'
}

app.events = new EventEmitter()

app.db = require('../src/models')(env.mongo_url);

app.configure 'development', ->
  # require('../lib/mongo-log')(app.db.mongo);

app.configure ->
  app.use express.cookieParser()
  app.use express.bodyParser()
  # app.use express.session
  #   secret: secrets.session,
  #   store: new RedisStore
  app.use app.router

app.listen(port)

console.log "App started on port #{port}"
