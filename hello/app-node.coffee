http = require('http')
http.createServer((req, res) ->
  res.writeHead(200, 'Content-Type': 'text/plain')
  res.end 'Hello World\n'
).listen 2000, '127.0.0.1'
