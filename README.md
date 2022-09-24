# Welcome To The Jungle

Welcome To The Jungle is a mini e-commerce application built with Ruby on Rails 6.1, Active Record and Rspec for testing. Users can browse products, add to cart and checks-out stripe payment system. If a user is an admin they are also able to add/remove items or create new categories using an admin dashboard. 

## Final Product
!["Landing"](https://github.com/Jbridges1119/Welcome-To-The-Jungles/blob/master/docs/Screenshot%20from%202022-09-24%2009-40-54.png?raw=true)
## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Built-With

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Dependencies

- "@rails/actioncable": "^6.0.0",
- "@rails/activestorage": "^6.0.0",
- "@rails/ujs": "^6.0.0",
- "@rails/webpacker": "5.4.0",
- "turbolinks": "^5.2.0",
- "webpack": "^4.46.0",
- "webpack-cli": "^3.3.12"
