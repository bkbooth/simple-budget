'use strict'

const app = require('./server')
const db = app.dataSources.db
const lbTables = [
  'Customer',
  'AccessToken',
  'ACL',
  'RoleMapping',
  'Role',
  'Budget',
  'CustomerBudget',
  'ExpectedItem',
  'ActualItem',
]

db.automigrate(lbTables)
  .then(() => console.log(`Loopback tables [${lbTables.join(', ')}] created in ${db.adapter.name}`))
  .then(() => db.disconnect())
