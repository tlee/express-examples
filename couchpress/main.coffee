exp = require 'express'
app = exp.createServer()
Articler = require('./articler').Articler 
article = new Articler 'http://localhost', 5984


app.configure () ->
    app.set 'view engine', 'jade'
    app.set 'views', "#{__dirname}/views"
    app.use exp.static "#{__dirname}/public"
    app.use exp.bodyParser()
    app.use exp.methodOverride()

app.listen 1337
console.log 'Server running'

app.get '/', (req, res) ->
  article.findAll (err, docs) ->
    res.render 'index', title: 'CouchPress', articles: docs

    app.get '/new', (req, res) ->
      res.render 'new', title: 'CouchPress / New Post'

app.post '/new', (req, res) ->
  article.save {
    title: req.param 'title'
    body: req.param 'body'
    created_at: new Date()
  }, (err, docs) -> res.redirect('/')

