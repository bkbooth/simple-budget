'use strict'

const periods = require('./periods')

module.exports = function(Budget) {
  Budget.validatesInclusionOf('period', { in: periods })

  Budget.observe('before save', (ctx, next) => {
    if (ctx.instance)
      ctx.instance.modified = Date.now()
    else
      ctx.data.modified = Date.now()

    next()
  })
}
