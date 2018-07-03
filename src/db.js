const mysql = require('mysql2/promise')

const url = process.env.DATABASE_URL || 'mysql://server:123456@localhost/rusch'
console.log(`MySQL connecting to: ${url}`)
const pool = mysql.createPool(`${url}?waitForConnections=true&connectionLimit=10&queueLimit=0`)

// Helpers

const first = async q => (await q)[0]
const exec = (query, params) => {
  console.log('SQL - ', { query, params })
  return first(pool.execute(query, params))
}

const exec1 = (query, params) => first(exec(`${query} LIMIT 1`, params))

// CRUD

// Articles

const getArticles = () => exec('SELECT * FROM articles')

const writeArticle = article => exec(`
  INSERT INTO articles (section, title, shortDescription, hasStar, tags, content)
  VALUES (?, ?, ?, ?, ?, ?)`, [ article.section, article.title, article.shortDescription, article.hasStar, article.tags, article.content ])

const updateArticle = article => exec(`
  UPDATE articles
  SET section=?, title=?, shortDescription=?, hasStar=?, tags=?, content=?
  WHERE id=?`, [ article.section, article.title, article.shortDescription, article.hasStar, article.tags, article.content, article.id ])

// Filters

const getFilters = () => exec('SELECT * FROM filters')

const writeFilter = filter => exec(`
  INSERT INTO filters (section, filterTag)
  VALUES (?, ?)`, [ filter.section, filter.filterTag ])

const updateFilter = filter => exec(`
  UPDATE filters
  SET section=?, filterTag=?
  WHERE id=?`, [ filter.section, filter.filterTag, filter.id ])

// Équipe members

const getEquipeMembers = () => exec('SELECT * FROM equipe')

const writeMember = member => exec(`
  INSERT INTO equipe (name, image, position, description, carreer, linkedIn, portfolio)
  VALUES (?, ?, ?, ?, ?, ?, ?)`, [ member.name, member.image, member.position, member.description, member.carreer, member.linkedIn, member.portfolio ])

const updateMember = member => exec(`
  UPDATE equipe
  SET name=?, image=?, position=?, description=?, carreer=?, linkedIn=?, portfolio=?
  WHERE id=?`, [ member.name, member.image, member.position, member.description, member.carreer, member.linkedIn, member.portfolio ])

// Partenaires

const getPartenaires = () => exec('SELECT * FROM partenaires')

const writePartenaires = partenaire => exec(`
  INSERT INTO partenaires (shortDescription, image)
  VALUES (?, ?)`, [ partenaire.shortDescription, partenaire.image ])

const deletePartenaire = id => exec(`DELETE FROM partenaires WHERE id=?`, [ id ])

module.exports = {
  getArticles,
  writeArticle,
  updateArticle,
  getFilters,
  writeFilter,
  updateFilter,
  getEquipeMembers,
  writeMember,
  updateMember,
  getPartenaires,
  writePartenaires,
  deletePartenaire
}
