# Ramilya's PDP-2

[![Build Status](https://semaphoreci.com/api/v1/ramilyanigmatullina/pdp-2/branches/google-omniauth-159385490/badge.svg)](https://semaphoreci.com/ramilyanigmatullina/pdp-2)

It's an simple app based on Rails 5 and Ruby 2.4.2.

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - runs rubocop, brakeman, rails_best_practices and bundle-audit for the app
* `bin/ci` - should be used in the CI or locally
* `bin/server` - to run server locally

## Dependencies

* Ruby 2.4.2
* Rails 5.1.2
* PostgreSQL
* PhantomJS

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```
## Quick Start

```bash
# clone repo
git clone git@github.com:RamilyaNigmatullina/pdp-2.git
cd pdp-2

# configure ENV variables in .env
vim .env

# run setup script
bin/setup

# Run test and quality suits to make sure all dependencies are satisfied and applications works correctly before making changes.
bin/ci

# run server on 5000 port
bin/server
```

## Test users

  - User: "user@example.com / 123456"

## Mailers

  http://localhost:5000/rails/mailers

## Production

* https://ramilya-pdp-2.herokuapp.com/
