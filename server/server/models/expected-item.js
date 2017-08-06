'use strict'

const itemTypes = require('./item-types')
const periods = require('./periods')

module.exports = function(ExpectedItem) {
  ExpectedItem.validatesInclusionOf('itemType', { in: itemTypes })
  ExpectedItem.validatesInclusionOf('period', { in: periods })

  ExpectedItem.observe('before save', (ctx, next) => {
    if (ctx.instance)
      ctx.instance.modified = Date.now()
    else
      ctx.data.modified = Date.now()

    next()
  })
}
