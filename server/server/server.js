'use strict'

const loopback = require('loopback')
const boot = require('loopback-boot')

const app = module.exports = loopback()

// Add /Users/me vanity endpoint
app.use(loopback.token({
  currentUserLiteral: 'me',
}))

app.start = () => {
  // start the web server
  return app.listen(() => {
    app.emit('started')
    const baseUrl = app.get('url').replace(/\/$/, '')
    console.log(`Web server listening at: ${baseUrl}`)
    if (app.get('loopback-component-explorer')) {
      const explorerPath = app.get('loopback-component-explorer').mountPath
      console.log(`Browse your REST API at ${baseUrl + explorerPath}`)
    }
  })
}

// Bootstrap the application, configure models, datasources and middleware.
// Sub-apps like REST API are mounted via boot scripts.
boot(app, __dirname, (err) => {
  if (err) throw err

  // start the server if `$ node server.js`
  if (require.main === module) {
    app.start()
  }
})
