const express = require('express')
const bodyParser = require('body-parser')

const db = require('./db')
const port = process.env.PORT || 3456

const app = express()

//AUTHENTIFICATION requirements
const path = require('path')
const session = require('express-session')
const sessionFileStore = require('session-file-store')
const FileStore = sessionFileStore(session)
const secret = 'je suis un beau secret'
//AUTHENTIFICATION function
const mustBeSignIn = (request, response, next) => {
  console.log('session:', request.session)
  if (!request.session.user) return next(Error('must be sign-in'))
  next()
}

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


//AUTHENTIFICATION Setup session handler
app.use(session({
  secret,
  saveUninitialized: false,
  resave: true,
  store: new FileStore({ path: path.join(__dirname, '../sessions'), secret })
}))


/*app.use((request, response, next) => {
  if (request.method !== 'POST' && request.method !== 'PUT') return next()
  let accumulator = ''

  request.on('data', data => {
    accumulator += data
  })

  request.on('end', () => {
    try {
      request.body = accumulator ? JSON.parse(accumulator) : {}
      next()
    } catch (err) {
      next(err)
    }
  })
})*/


//AUTHENTIFICATION route de sign in

app.post('/sign-in', (request, response, next) => {
  const username = request.body.username
  const password = request.body.password

  db.getUser()
    .then(users => {
    /*console.log(users)*/
    const userFound = users.find(user => user.username === username)
    console.log(userFound, { username, password })
    if (!userFound) {
      throw Error('User not found')
    }
    if (userFound.password !== password) {
      throw Error('Wrong password')
    }

    request.session.user = userFound
    console.log('user', userFound.username, 'connected with great success')
    response.json('ok')
  })
  .catch(next)

})

// ROUTES
//Articles

app.get('/articles/:id', (req, res, next) => {
  db.readArticles.byId(req.params.id)
    .then(article => res.json(article))
    .catch(next)
})

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

app.delete('/articles/:id', (req, res, next) => {
  const articleId = req.params.id
  db.deleteArticle(articleId)
    .then(() => res.json('Article deleted !'))
    .catch(next)
 })

//ROUTES
//filters

app.get('/filters/:id', (req, res, next) => {
  db.readFilters.byId(req.params.id)
    .then(filter => res.json(filter))
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

app.delete('/filters/:id', (req, res, next) => {
  const filterId = req.params.id
  db.deleteFilter(filterId)
    .then(() => res.json('Filter deleted !'))
    .catch(next)
 })

//ROUTES
//equipe

app.get('/equipe/:id', (req, res, next) => {
  db.readMembers.byId(req.params.id)
    .then(member => res.json(member))
    .catch(next)
})

app.get('/equipe', (request, response, next) => {
  db.getMembers()
    .then(members => response.json(members))
})

app.post('/equipe', mustBeSignIn, (request, response, next) => {
  const member = request.body

  db.writeMember(member)
    .then(() => response.json('ok'))
    .catch(next)
})

app.put('/equipe/:id', (request, response, next) => {
  const member = request.body
  member.id = request.params.id

  db.updateMember(member)
    .then(() => response.json('ok'))
    .catch(next)
})

 app.delete('/equipe/:id', (req, res, next) => {
   const memberId = req.params.id
   db.deleteMember(memberId)
     .then(() => res.json('Member deleted !'))
     .catch(next)
  })

 //ROUTES
 //partenaires

 app.get('/partenaires/:id', (req, res, next) => {
   db.readPartenaires.byId(req.params.id)
     .then(partenaire => res.json(partenaire))
     .catch(next)
 })

app.get('/partenaires', (request, response, next) => {
  db.getPartenaires()
    .then(partenaires => response.json(partenaires))
})

app.post('/partenaires', (request, response, next) => {
  const partenaire = request.body

  db.writePartenaire(partenaire)
    .then(() => response.json('ok'))
    .catch(next)
})

app.put('/partenaires/:id', (request, response, next) => {
  const partenaire = request.body
  partenaire.id = request.params.id

  db.updatePartenaire(partenaire)
    .then(() => response.json('ok'))
    .catch(next)
})

app.delete('/partenaires/:id', (req, res, next) => {
  const partenaireId = req.params.id
  db.deletePartenaire(partenaireId)
    .then(() => res.json('Partenaire deleted !'))
    .catch(next)
 })

app.listen(port, () => console.log(`Oh oui, je suis connecté au port ${port}!!! YEAH!!! C\'est tellement bon!! C\'est une expérience incomparable!!`))
