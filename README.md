# Welcome to the Jungle!

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. For this project I inherited an existing codebase and learned a new language, ecosystem, and framework.

## Features

- User registration
- User sessions and authentication
- Admin platform for product upload and managing categories
- Adding products to cart
- Reviewing and rating products
- Checkout via credit card (using Stripe)
- Order confirmation page and email

## Using Jungle:
![screenshot1](https://github.com/maryshrives/jungle-rails/blob/master/public/docs/jungle1.png?raw=true)
![screenshot2](https://github.com/maryshrives/jungle-rails/blob/master/public/docs/jungle2.png?raw=true)
![screenshot3](https://github.com/maryshrives/jungle-rails/blob/master/public/docs/jungle3.png?raw=true)
![screenshot4](https://github.com/maryshrives/jungle-rails/blob/master/public/docs/jungle4.png?raw=true)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
