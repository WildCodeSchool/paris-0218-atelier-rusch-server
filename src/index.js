const express = require('express')
const app = express()
const db = require('./db')

const port = process.env.PORT || 3456

app.use((request, response, next) => {
  response.header('Access-Control-Allow-Origin', request.headers.origin)
  response.header('Access-Control-Allow-Credentials', 'true') // important
  response.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE') // important
  response.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
  next()
})

app.get('/article', (request, response) => {
  db.getArticle()
    .then(article => response.json(article))
})

app.listen(port, () => console.log(`Oh oui, je suis connecté au port ${port}!!! YEAH!!! C\'est tellement bon!! C\'est une expérience incomparable!!`))
