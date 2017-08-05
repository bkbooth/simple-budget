'use strict'

const server = require('./server')
const ds = server.dataSources.db
const lbTables = ['User', 'AccessToken', 'ACL', 'RoleMapping', 'Role']

ds.automigrate(lbTables)
  .then(() => console.log(`Loopback tables [${lbTables.join(', ')}] created in ${ds.adapter.name}`))
  .then(() => ds.disconnect())
