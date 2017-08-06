'use strict'

module.exports = function(Customer) {
  Customer.observe('before save', (ctx, next) => {
    if (ctx.instance)
      ctx.instance.modified = Date.now()
    else
      ctx.data.modified = Date.now()

    next()
  })
}
