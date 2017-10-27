const env = process.env.NODE_ENV || 'development'
const config = require('./knexfile')[env]
const knex = require('knex')(config)

const query = knex('computers')

query.then(result => {
  console.log(result)
  knex.destroy()
}).catch(() => {
  knex.destroy()
})
