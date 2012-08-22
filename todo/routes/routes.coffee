db = require ("../db_connect")

exports.index = (req, res) ->
  res.render "index", title: "Index"

exports.todo = (req, res) -> displayTodos(res, "New Todo List")

exports.saveTodo = (req, res) ->
  db.save {'name': req.param 'todo-text'}, (err, todos) ->
    if err
      res.redirect('/')
    else
      displayTodos(res, "Todo List Modified")

displayTodos = (res, title) ->
  db.getAll 'todos/all', (todos) ->
    res.render "todo",
      title: title
      todos: todos
