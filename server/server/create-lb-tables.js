'use strict'

const server = require('./server')
const ds = server.dataSources.db
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

ds.automigrate(lbTables)
  .then(() => console.log(`Loopback tables [${lbTables.join(', ')}] created in ${ds.adapter.name}`))
  .then(() => ds.disconnect())
