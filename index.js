const express = require('express')
const app = express()
const mysql = require('mysql2/promise')
const db = require('./db')



app.use((request, response, next) => {
  response.header('Access-Control-Allow-Origin', request.headers.origin)
  response.header('Access-Control-Allow-Credentials', 'true') // important
  response.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE') // important
  response.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
  next()
})

// db.getHomepage().then(console.log)

// .then(connection =>{
// 	return connection.query('SELECT * FROM HOMEPAGE')
// })
// 	.then(console.log, console.error)

app.get('/homepage', (request, response) => {
  db.getHomepage()
	  .then(homepage => response.json(homepage))
})

app.get('/article', (request, response) => {
  db.getArticle()
    .then(article => response.json(article))

})
app.listen(3003, () => console.log('Oh oui, je suis connecté au port 3003!!! YEAH!!! C\'est tellement bon!! C\'est une expérience incomparable!!'))
