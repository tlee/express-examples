###
Module dependencies.
###
express = require("express")
routes = require("./routes/routes")
http = require("http")
path = require("path")
app = express()

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use require("less-middleware")(src: __dirname + "/public")
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()

# Routes
app.get "/", routes.index
app.get "/todo", routes.todo
app.post "/todo", routes.saveTodo

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")

