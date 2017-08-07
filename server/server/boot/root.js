'use strict'

module.exports = function(server) {
  // Install a `/up` route that returns server status
  const router = server.loopback.Router()
  router.get('/up', server.loopback.status())
  router.get('/', (req, res) => res.redirect('/up'))
  server.use(router)
}
