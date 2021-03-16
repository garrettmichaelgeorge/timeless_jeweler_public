<h1 align="center">Timeless Jeweler App</h1>
<div align="center">

  [![Maintainability](https://api.codeclimate.com/v1/badges/2e9f659f4ba63f50d6dd/maintainability)](https://codeclimate.com/github/garrettmichaelgeorge/timeless_jeweler_public/maintainability)
  [![Test Coverage](https://api.codeclimate.com/v1/badges/2e9f659f4ba63f50d6dd/test_coverage)](https://codeclimate.com/github/garrettmichaelgeorge/timeless_jeweler_public/test_coverage)

  The Timeless Jeweler Web App is a commercial retail management web app for jewelers. Manage customers, inventory, sales, and services all in one place.

  Note that this repository is a public mirror only, with some front-end assets
  ommitted for copyright purposes. Cloning the repo and setting it up locally
  should work but may look rather strange. **For the live running application, see
  the demo**.

  Check out the demo at https://admin.timelessjeweler.com/

  email: demo@example.com

  password: password
</div>

## Features
* Manage customers, inventory, and sales (services coming soon!)

* A data model tailor-fit for the jewelry domain.

* Reactive user interface using [Stimulus Reflex](https://github.com/hopsoft/stimulus_reflex) (HTML over the wire using WebSockets)

* Secure authentication using [Devise](https://github.com/heartcombo/devise)

* Component-based view layer using [View Component](https://github.com/joelhawksley/view-component) gem

* Beautiful custom Bootstrap UI using [Dashkit](https://dashkit.goodthemes.co/) theme with [Cerebri Sans](https://www.myfonts.com/fonts/hanken-designco/cerebri-sans?tab=techSpecs) and [Feather](https://feathericons.com) icons

## Technologies
* Ruby on Rails 6.1

* Stimulus Reflex

* PostgreSQL 12

* Bootstrap 5 (no jQuery)

* Webpack/Webpacker

* Redis with separate instances for caching and session storage

* Heroku

* Service worker

## Requirements

* Ruby version 3.0+

## Code highlights

For those interested in the source code, here follows a brief discussion of some
of the design decisions made during development. Links are included to the
relevant source code files.

### SKU Generator

See the [SKU value
object](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/app/models/sku.rb)
and its [unit
test](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/test/models/sku_test.rb)
for an automatic SKU generator utilizing the [Visitor
pattern](https://refactoring.guru/design-patterns/visitor) and [Dependency
Injection](hh$ps://en.wikipedia.org/wiki/Dependency_injection), developed
test-first. Modeled after examples by [Matt
Wynn](https://youtu.be/CGN4RFkhH2M?t=1320) and Sandi Metz ([Practical Object-Oriented Design, 2nd ed.](https://www.poodr.com/), pp. 72-74).

### Multiple Table Inheritance
See 
[Item](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/app/models/item.rb),
[Piece](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/app/models/piece.rb),
and
[Piece::Profile](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/app/models/piece/profile.rb)
for an implementation of Multiple Table Inheritance (MTI) in Rails. This allows
subtypes to hold not only unique attributes but also unique associations. A
gemstone, for instance, can either be sold loose or mounted on a jewelry
piece.

One of the principal challenges of the jewelry inventory domain is the unique
nature of each inventory category. The app currently supports jewelry pieces,
loose gemstones, and miscellaneous items (e.g. handbags). A loose gemstone is a
gemstone that is sold individually, whereas a mounted gemstone is attached to a
piece. All gemstones have lab reports, some of them have diamond gradings, and
some of them are not sold at all. Pieces, on the other hand, may have multiple
gemstones but know nothing of lab reports and the like. Thus each type of item
requires its own branching associations.

Several other inheritance solutions exist, most prominently the three outlined
by DHH: polymorphic associations, single-table inheritance (STI), and his own
solution, delegated types. These form the canonical Rails-way solutions to
inheritance. Multiple-table inheritance, has, despite its ubiquity in other
database-backed environments, has never enjoyed mainstream usage in the Rails
world, though it has been discussed in various places and implemented in
third-party gems such as
[ActiveRecord::ActsAs](https://github.com/chaadow/active_record-acts_as).

After considering the tradeoffs, I opted for the MTI approach outlined by
[belighted](https://belighted.com/blog/implementing-multiple-table-inheritance-in-rails),
which cleverly uses Rails' built-in STI mechanism to set up the inheritance
hierarchy. This approach affords integrity at the DB level, avoids unnecessary
dependencies (no gems), and allows utmost flexibility in terms of branching
associations.
