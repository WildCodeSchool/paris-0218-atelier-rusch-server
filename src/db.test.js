const db = require('./db')

it('works with resolves', () => {
  expect.assertions(1)
  return db.getArticles().then(articles => expect(articles.length).toEqual(3))
})
