# Shiken [試験] #

Shiken is a ruby gem that is a wrapper for selenium.  In our experience, many people write "scripts" using selenium - not "tests".  The difference being you can start a set of tests and walk away... then come back and find out what passed or failed.  Scripts are something you have to watch to see what is going on.  Using rspec is our key to writing tests.  Shiken has been designed, developed and tested with rails and rspec.

There are other similar frameworks... this is just my own way of digging into automation test and techniques (and ruby code for that matter).

Shiken is the Japanese word for test.

## Project Design Philosopy ###

* the test pyramid
* rely on unit tests
* but have sanity tests
* test on production
* use page oriented tests
* good tests require programming
* tests clean up after themselves
* you can run test individually


## Installation

Add `shiken` to **both** the `:development` and `:test` groups in the
`Gemfile`.  Note the other dependencies.

```ruby
group :development, :test do
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7'
  gem 'colorize'
  gem 'shiken', '~> 0.1'
end
```

Download and install by running:

```
bundle install
```

Initialize the `webtests/` directory (where specs will reside) with:

```
rails generate rspec:install
```

This adds the following example test suites that demonstrate how to use shiken:

- `webtests/google`    # simple tests of google site
- `webtests/travel`    # more complex example of tests of **[agile travel](http://travel.agileway.net)**

Each example **must** be run independently. Check the code in the files for more information.  Your task is probably to copy the travel example and adapt ti to your own website.  Note that like the exampls the specs do not necessarily have to be related to the rails application, but can be used independently as a test vehicle.  But, the normal case is as part of the rails project... and correctlydesigned can be run against both localhost and the production system.

Use the `rspec` command to run the example specs:

```
# Run only the google specs
rspec webtests/google

# Run only travel specs
rspec webtests/travel

# Run only one spec file
rspec webtests/travel/test01_login_spec.rb

```

By default the above will run all `_spec.rb` files in the `webtests/{example}` directory. For
more details about this see the [RSpec spec file
docs](https://www.relishapp.com/rspec/rspec-core/docs/spec-files).

To run only a subset of these specs use the following command:

```
# Run only model specs
bundle exec rspec spec/models

# Run only specs for AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb

# Run only spec on line 8 of AccountsController
bundle exec rspec spec/controllers/accounts_controller_spec.rb:8
```

Specs can also be run via `rake spec` or `bundle exec rspec`, though this command may 
be slower to start than the `rspec` command.


### Upgrade Note

To be determined.

**NOTE:** Generators run in RSpec 3.x will now require `rails_helper` instead
of `spec_helper`.

### Generators

None as yet.

## Contributing

Not yet ready for other contributors.

## Page Oriented Tests

Use model specs to describe behavior of web pages (usually ActiveRecord-based) in
the application.

## The Google Example

## The Travel Example

## Routing specs

## Upgrade note

## Also see

* [https://github.com/rspec/rspec](https://github.com/rspec/rspec)
* [https://github.com/rspec/rspec-rails](https://github.com/rspec/rspec-rails)

## Feature Requests & Bugs

See <http://github.com/pconley/shiken/issues>