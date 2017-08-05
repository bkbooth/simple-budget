'use strict'

module.exports = {
  db: {
    host: process.env.POSTGRES_HOST || 'localhost',
    port: Number(process.env.POSTGRES_PORT) || 5432,
    database: process.env.POSTGRES_DB || 'simple_budget',
    user: process.env.POSTGRES_USER || 'simple_budget',
    password: process.env.POSTGRES_PASSWORD || 'simple_budget',
  },
}
