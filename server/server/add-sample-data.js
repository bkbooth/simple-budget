'use strict'

if (process.env.NODE_ENV === 'production') return

const app = require('./server')

// Check for and add a user
app.models.Customer.count()
  .then((numberOfCustomers) => {
    if (numberOfCustomers > 0)
      throw new Error('Skipping adding sample data')

    return app.models.Customer.create({
      email: 'foo@bar.com',
      password: 'foobar',
    })
      .then((customer) => ({ customer }))
  })
  .then(({ customer }) => {
    console.log(`Created user: ${customer.email}`)

    // Add a budget
    return app.models.Budget.create({
      name: 'Family Budget',
      period: 'Month',
    })
      .then((budget) =>
        customer.budgets.add(customer.id).then(() => ({ customer, budget })))
  })
  .then(({ customer, budget }) => {
    console.log(`Created budget: ${budget.name}`)

    // Add some expected items
    return app.models.ExpectedItem.create([{
      budgetId: budget.id,
      itemType: 'Income',
      name: 'Salary',
      period: 'Month',
      value: 6000,
    }, {
      budgetId: budget.id,
      itemType: 'Saving',
      name: 'Regular savings',
      period: 'Month',
      value: 500,
    }, {
      budgetId: budget.id,
      itemType: 'Bill',
      name: 'Rent',
      period: 'Week',
      value: 350,
    }, {
      budgetId: budget.id,
      itemType: 'Bill',
      name: 'Mobile phones',
      period: 'Month',
      value: 110,
    }, {
      budgetId: budget.id,
      itemType: 'Donation',
      name: 'Offering',
      period: 'Month',
      value: 600,
    }])
      .then((expectedItems) => {
        console.log(`Created expected items: ${expectedItems.map(i => i.name).join(', ')}`)
        return { customer, budget, expectedItems }
      })
  })
  .then(({ budget, expectedItems }) => {
    return app.models.ActualItem.create([{
      budgetId: budget.id,
      expectedItemId: expectedItems[0].id,
      value: 3700,
      valueDate: Date.now(),
      comment: 'Paid a little more with leave loading',
    }])
      .then((actualItems) =>
        console.log(`Created ${actualItems.length} actual items`))
  })
  .catch((err) => console.log(err.message))
