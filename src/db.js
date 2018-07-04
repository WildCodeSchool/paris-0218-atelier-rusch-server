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

const getArticles = async () => {
  const articles = await exec('SELECT * FROM articles')

  return articles.map(article => {
    article.content = JSON.parse(article.content)
    return article
  })
}

const readArticles = async () => {
  const articles = await exec('SELECT * FROM articles')

  return articles.map(article => {
    article.content = JSON.parse(article.content)
    return article
  })
}

readArticles.byId = async id => {
  const article = await exec1(`SELECT * FROM articles WHERE id=?`, [ id ])

  article.content = JSON.parse(article.content)
  return article
}

const writeArticle = article => exec(`
  INSERT INTO articles (section, title, shortDescription, hasStar, tags, content)
  VALUES (?, ?, ?, ?, ?, ?)`, [ article.section, article.title, article.shortDescription, article.hasStar, article.tags, JSON.stringify(article.content) ])

const updateArticle = article => exec(`
  UPDATE articles
  SET section=?, title=?, shortDescription=?, hasStar=?, tags=?, content=?
  WHERE id=?`, [ article.section, article.title, article.shortDescription, article.hasStar, article.tags, JSON.stringify(article.content), article.id ])

const deleteArticle = id => exec(`DELETE FROM articles WHERE id=?`, [ id ])

// Filters

const readFilters = () => exec('SELECT * FROM filters')
readFilters.byId = id => exec1(`SELECT * FROM filters WHERE id=?`, [ id ])

const getFilters = () => exec('SELECT * FROM filters')

const writeFilter = filter => exec(`
  INSERT INTO filters (section, filterTag)
  VALUES (?, ?)`, [ filter.section, filter.filterTag ])

const updateFilter = filter => exec(`
  UPDATE filters
  SET section=?, filterTag=?
  WHERE id=?`, [ filter.section, filter.filterTag, filter.id ])

const deleteFilter = id => exec(`DELETE FROM filters WHERE id=?`, [ id ])

// Équipe members


const readMembers = () => exec('SELECT * FROM equipe')
readMembers.byId = id => exec1(`SELECT * FROM equipe WHERE id=?`, [ id ])

const getMembers = () => exec('SELECT * FROM equipe')

const writeMember = member => exec(`
  INSERT INTO equipe (name, image, position, description, carreer, linkedIn, portfolio)
  VALUES (?, ?, ?, ?, ?, ?, ?)`, [ member.name, member.image, member.position, member.description, member.carreer, member.linkedIn, member.portfolio ])

const updateMember = member => exec(`
  UPDATE equipe
  SET name=?, image=?, position=?, description=?, carreer=?, linkedIn=?, portfolio=?
  WHERE id=?`, [ member.name, member.image, member.position, member.description, member.carreer, member.linkedIn, member.portfolio, member.id ])

const deleteMember = id => exec(`DELETE FROM equipe WHERE id=?`, [ id ])

// Partenaires

const readPartenaires = () => exec('SELECT * FROM partenaires')
readPartenaires.byId = id => exec1(`SELECT * FROM partenaires WHERE id=?`, [ id ])

const getPartenaires = () => exec('SELECT * FROM partenaires')

const writePartenaire = partenaire => exec(`
  INSERT INTO partenaires (shortDescription, image)
  VALUES (?, ?)`, [ partenaire.shortDescription, partenaire.image ])

const updatePartenaire = partenaire => exec(`
  UPDATE partenaires
  SET shortDescription=?, image=?
  WHERE id=?`, [ partenaire.shortDescription, partenaire.image, partenaire.id ])

const deletePartenaire = id => exec(`DELETE FROM partenaires WHERE id=?`, [ id ])

module.exports = {
  readArticles,
  getArticles,
  writeArticle,
  updateArticle,
  deleteArticle,
  readFilters,
  getFilters,
  writeFilter,
  updateFilter,
  deleteFilter,
  readMembers,
  getMembers,
  writeMember,
  updateMember,
  deleteMember,
  readPartenaires,
  getPartenaires,
  writePartenaire,
  updatePartenaire,
  deletePartenaire
}
