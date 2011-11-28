env = module.exports = {
  node_env: process.env.NODE_ENV || 'development',
  port: parseInt(process.env.PORT) || 8000,
  mongo_url: process.env.MONGOHQ_URL || 'mongodb://localhost/cheat_development'
}

env.development = env.node_env is 'development'
env.production = !env.development

if env.development
  env.hostname = 'http://localhost:' + env.port
else
  env.hostname = 'http://cheat.nodejitsu.com'
