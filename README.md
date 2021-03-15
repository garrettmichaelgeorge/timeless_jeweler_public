<h1 align="center">Timeless Jeweler App</h1>
<div align="center">
  <a href="https://codeclimate.com/github/garrettmichaelgeorge/timeless_jeweler_public/maintainability">
    <img src="https://api.codeclimate.com/v1/badges/2e9f659f4ba63f50d6dd/maintainability"/>
</a>
  <p>The Timeless Jeweler Web App is a commercial retail management web app for jewelers. Manage customers, inventory, sales, and services all in one place.</p>

Check out the demo at https://admin.timelessjeweler.com/

email: demo@example.com

password: password
</div>

## Features
* A data model tailor-fit for the jewelry domain.

* Intelligently track customers, inventory, and sales (services coming soon!)

* Reactive user interface using [Stimulus Reflex](https://github.com/hopsoft/stimulus_reflex) (HTML over the wire using WebSockets)

* Secure authentication using [Devise](https://github.com/heartcombo/devise)

* Component-based view layer using [View Component](https://github.com/joelhawksley/view-component) gem

* Beautiful custom Bootstrap UI using [Dashkit]() theme with [Cerebri Sans](https://www.myfonts.com/fonts/hanken-designco/cerebri-sans?tab=techSpecs) and [Feather](https://feathericons.com) icons

## Requirements

* Ruby version 2.7.2+

    ```bash
    ruby -v
    ```

## Code highlights
### SKU Generator

For those interested, see the [SKU value
object](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/app/models/sku.rb)
and its [unit
test](https://github.com/garrettmichaelgeorge/timeless_jeweler_public/blob/public/test/models/sku_test.rb)
for an automatic SKU generator utilizing the [Visitor
pattern](https://refactoring.guru/design-patterns/visitor) and [Dependency
Injection](hh$ps://en.wikipedia.org/wiki/Dependency_injection), developed
test-first. Modeled after examples by [Matt
Wynn](https://youtu.be/CGN4RFkhH2M?t=1320) and Sandi Metz ([Practical Object-Oriented Design, 2nd ed., pp. 72-74](https://www.poodr.com/)).

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

Several other inheritance solutions exist, most prominently the three outlined
by DHH: polymorphic associations, single-table inheritance (STI), and his own
solution, delegated types. These form the canonical Rails-way solutions to
inheritance. Multiple-table inheritance, has, despite its
ubiquity in the larger data modeling world, never enjoyed mainstream usage
in the Rails world, being relegated rather to less-used third-party gems such as
[ActiveRecord::ActsAs](https://github.com/chaadow/active_record-acts_as). After
considering the tradeoffs, I opted for the MTI approach outlined by
[belighted](https://belighted.com/blog/implementing-multiple-table-inheritance-in-rails),
which ensures referential integrity at the DB level, avoids unnecessary
dependencies (no gems), and allows utmost flexibility in terms of branching
associations.

