# Ramilya's PDP-2

It's an simple app based on Rails 5 and Ruby 2.4.2.

It's the website for searching hotels.

There is the following functionality is present on this website:
* There is the ability to sign in with Google
* There is the ability to sign in with Facebook
* There is the ability to choose a timezone on the settings page. If you will not choose a timezone, it will be based on your IP address.
* There is the ability to allow the browser to use your geolocation. If you will not allow the browser to  use your geolocation, geolocation will be determined based on your IP address.
* Complex search by several related models for several fields. You can search hotels by name, address, city and country. Also you can filter hotels by stars amount, rating and radius. If you allow to use your geolocation, the search by radius will be more accurate.
* There is the ability to create hotels if you signed in as admin user

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

  - User: "user@example.com / password"
  - Admin: "admin@example.com / password"

## Mailers

  http://localhost:5000/rails/mailers

## Production

* https://ramilya-pdp-2.herokuapp.com/
