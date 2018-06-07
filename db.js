const mysql = require('mysql2/promise')

const co = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  database: 'rusch'
})

const exec = async (query, params) => {
  const connection = await co
  const result = await connection.execute(query, params)
  return result[0]
}

const getArticle = () => exec('SELECT * FROM article')

module.exports = {
  getArticle
}
