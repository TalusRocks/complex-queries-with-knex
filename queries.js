const env = process.env.NODE_ENV || 'development'
const config = require('./knexfile')[env]
const knex = require('knex')(config)

const queries = {}

queries.allComputers = knex('computers')
queries.allUsers = knex('users')
queries.allDirectories = knex('directories')
queries.allFiles = knex('files')

// Test out a specific query here!
queries.allComputers.then(result => {
  console.log(result)
  knex.destroy()
}).catch(() => {
  knex.destroy()
})
