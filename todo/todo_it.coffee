cradle = require('cradle')

class TodoIt
  constructor: (host, port) ->
    connect = new cradle.Connection host, port, {cash: true, raw: false}
    @db = connect.database 'todos'

  create: ->

  remove: ->

