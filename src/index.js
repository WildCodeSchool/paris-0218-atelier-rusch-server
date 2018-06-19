const express = require('express')
const bodyParser = require('body-parser')

const db = require('./db')
const port = process.env.PORT || 3456

const app = express()

// MIDDLEWARES

app.use((request, response, next) => {
  response.header('Access-Control-Allow-Origin', request.headers.origin)
  response.header('Access-Control-Allow-Credentials', 'true') // important
  response.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE') // important
  response.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
  next()
})

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))


// ROUTES

app.get('/articles', (request, response, next) => {
  db.getArticles()
    .then(articles => response.json(articles))
})

app.post('/articles', (request, response, next) => {
  const article = request.body

  db.writeArticle(article)
    .then(() => response.json('ok'))
    .catch(next)
})

app.put('/articles/:id', (request, response, next) => {
  const article = request.body
  article.id = request.params.id

  db.updateArticle(article)
    .then(() => response.json('ok'))
    .catch(next)
})

app.get('/filters', (request, response, next) => {
  db.getFilters()
    .then(filters => response.json(filters))
})

app.post('/filters', (request, response, next) => {
  const filter = request.body

  db.writeFilter(filter)
    .then(() => response.json('ok'))
    .catch(next)
})

app.put('/filters/:id', (request, response, next) => {
  const filter = request.body
  filter.id = request.params.id

  db.updateFilter(filter)
    .then(() => response.json('ok'))
    .catch(next)
})

app.listen(port, () => console.log(`Oh oui, je suis connecté au port ${port}!!! YEAH!!! C\'est tellement bon!! C\'est une expérience incomparable!!`))
