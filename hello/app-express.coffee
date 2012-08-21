app = require('express')()
app.get('/', (req, res) -> res.send('Hello'))
app.listen(2000)
