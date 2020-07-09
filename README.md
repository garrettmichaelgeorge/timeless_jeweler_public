# Timeless Jeweler Web App

See the demo at https://iowhlbk.herokuapp.com/

This is a retail management web app that tracks business information for
customers, products, and services. It is not a Point-of-Sale (POS) app and
is intended for record-keeping only.

## Features

* Intelligently track retail data related to customers and inventory
  (services coming soon!)

* Easily perform CRUD (create, read, update, destroy) actions using visual
  interface

* Secure authentication using
[Devise](https://github.com/heartcombo/devise) gem

* Component-based view layer using [View
  Component](https://github.com/joelhawksley/view-component) gem

* Beautiful custom Bootstrap UI using [Dashkit]() theme with [Cerebri
  Sans](https://www.myfonts.com/fonts/hanken-designco/cerebri-sans?tab=techSpecs)
  and [Feather](https://feathericons.com) icons

## Requirements

* Ruby version 2.7.0+
    
    ```
    # bash
    # to check:

    ruby -v
    ```

## Installation

1. Clone the repository

    ```
    # bash

    git clone https://github.com/garrettmichaelgeorge/timeless-jeweler
    ```

2. Install all gems listed in Gemfile
    
    ```
    # bash

    bundle install
    ```

3. Create the database and load the schema from schema.rb

    ```
    # bash

    bin/rails db:create
    bin/rails db:schema:load
    bin/rails db:seed # optional
    ```

4. Set up Yarn

    ```
    # bash

    yarn install
    ```

5. Run the test suite

    ```
    # bash

    bin/rails test
    ```

6. Start the Webpack dev server to compile assets

    ```
    # bash

    bin/webpack-dev-server
    ```

7. Start the Rails server

    ```
    # bash

    bundle exec rails server
    ```
