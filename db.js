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

const getHomepage = () => exec('SELECT * FROM homepage')
const updateHomepage = params => exec('UPDATE homepage SET title=?, description=? WHERE id=1', [params.title, params.description])

const getArticle = () => exec('SELECT * FROM article')

updateHomepage({ title: 'FanFan', description: 'FanFan est aux toilettes'})
getHomepage()
	//.then(homepage => console.log('fanch:', homepage))

module.exports = {
	getHomepage,
  updateHomepage,
  getArticle
}
