const express = require('express')
const app = express()
const mysql = require('mysql2/promise')
const db = require('./db')

db.getHomepage().then(console.log)

// .then(connection =>{
// 	return connection.query('SELECT * FROM HOMEPAGE')
// })
// 	.then(console.log, console.error)

app.get('/homepage', (request, response) => {
  db.getHomepage()
	  .then(homepage => response.json(homepage))
})

app.listen(3003, () => console.log('Oh oui, je suis connecté au port 3003!!! YEAH!!! C\'est tellement bon!! C\'est une expérience incomparable!!'))
