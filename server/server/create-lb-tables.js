'use strict';

const server = require('./server');
const ds = server.dataSources.db;
const lbTables = ['User', 'AccessToken', 'ACL', 'RoleMapping', 'Role'];
ds.automigrate(lbTables, (err) => {
  if (err) throw err;

  console.log(`Loopback tables [${lbTables.join(', ')}] created in ${ds.adapter.name}`);
  ds.disconnect();
});
