# Timeless Jeweler Web App

This is a retail management web app that tracks business information for
customers, products, and services. It is not a Point-of-Sale (POS) app and
is intended for record-keeping only.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Requirements
* Ruby version 2.7.0+

## Installation

1. Clone the repository

```
git clone https://github.com/garrettmichaelgeorge/timeless-jeweler
```

2. Create the database and load the schema from schema.rb

    ```
    # bash

    bin/rails db:create
    bin/rails db:schema:load
    bin/rails db:seed # optional
    ```

3. Set up Yarn

    ```
    # bash

    yarn install
    ```

4. Run the test suite

    ```
    # bash

    bin/rails test
    ```

5. Start the Webpack dev server to compile assets

    ```
    # bash

    bin/webpack-dev-server
    ```

6. Start the Rails server

    ```
    # bash

    bundle exec rails server
    ```
