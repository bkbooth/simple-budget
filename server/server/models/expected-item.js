'use strict'

const itemTypes = require('./item-types')
const periods = require('./periods')

module.exports = function(ExpectedItem) {
  ExpectedItem.validatesInclusionOf('itemType', { in: itemTypes })
  ExpectedItem.validatesInclusionOf('period', { in: periods })

  ExpectedItem.observe('before save', (ctx, next) => {
    if (ctx.instance)
      ctx.instance.updated = Date.now()
    else
      ctx.data.updated = Date.now()

    next()
  })
}
