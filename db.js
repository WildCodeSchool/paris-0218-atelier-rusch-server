const mysql = require('mysql2/promise')

const co = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	database: 'rusch'
})


const getHomepage = async () => {
  const connection = await co
  const result = await connection.execute('SELECT * FROM homepage')
  return result[0]  
}

module.exports = {
	getHomepage
}
