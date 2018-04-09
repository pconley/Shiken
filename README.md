# shiken [![Build Status](https://secure.travis-ci.org/rspec/rspec-rails.svg?branch=master)](http://travis-ci.org/rspec/rspec-rails) [![Code Climate](https://img.shields.io/codeclimate/github/rspec/rspec-rails.svg)](https://codeclimate.com/github/rspec/rspec-rails)
**rspec-rails** is a testing framework for Rails 3.x, 4.x and 5.0.

Use **[rspec-rails 1.x](http://github.com/dchelimsky/rspec-rails)** for Rails
2.x.

## Installation

Add `shiken` to **both** the `:development` and `:test` groups in the
`Gemfile`:

```ruby
group :development, :test do
  gem 'shiken', '~> 0.1'
end

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

Each example must be run independently. Check the code in the files for more information.

Use the `rspec` command to run the example specs:

```
# Run only model specs
rspec webtests/google

# Run only model specs
rspec webtests/travel
```

By default the above will run all `_spec.rb` files in the `webtests` directory. For
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