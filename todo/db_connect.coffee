cradle = require('cradle')
connect = new cradle.Connection '127.0.0.1', '5984', {cash: true, raw: false}
db = connect.database 'todos'

exports.save = (data, callback) ->
  db.save data, (err, res) -> callback err, res

exports.getAll = (view, callback) ->
  db.view view, {descending: true}, (err, res) -> 
    docs = []
    res.forEach (row) -> docs.push row
    callback docs
