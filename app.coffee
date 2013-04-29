express = require 'express'
routes = require './routes'
user = require './routes/user'
http = require 'http'
path = require 'path'
stylus = require 'stylus'
bootstrap = require 'bootstrap-stylus'
fs = require 'fs'
coffee = require 'coffee-script'

app = express()

compile = (str, path) ->
  return stylus(str)
    .set('filename', path)
    .use(bootstrap())

app.set('port', process.env.PORT || 3000)
app.set('views', __dirname + '/views')
app.set('view engine', 'ejs')
app.use(express.favicon())
app.use(express.logger('dev'))
app.use(express.bodyParser())
app.use(express.methodOverride())
app.use(app.router)
app.use stylus.middleware
  src: "#{__dirname}/app/assets"
  dest: __dirname + '/public'
  compress: true
  compile: compile
app.use(express.static(path.join(__dirname, 'public')))


if 'development' == app.get('env')
  app.use(express.errorHandler())
  app.get /.js$/, (req, res) ->
    coffeePath = 'app/assets/javascripts'
    reqJs = req.originalUrl.substring(1, req.originalUrl.length - 3)
    res.header 'Content-Type', 'application/x-javascript'
    cs = fs.readFileSync "#{__dirname}/#{coffeePath}/#{reqJs}.coffee", "ascii"
    js = coffee.compile cs
    res.send js

app.get('/', routes.index)
app.get('/users', user.list)

http.createServer(app).listen app.get('port'), () ->
  console.log('Express server listening on port ' + app.get('port'))
