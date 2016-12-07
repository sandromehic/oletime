# Oletime

[![Build Status](https://travis-ci.org/sandromehic/oletime.svg?branch=master)](https://travis-ci.org/sandromehic/oletime)

Just a simple gem to convert ruby Time objects to OLE float datetime and viceversa.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oletime'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oletime

## Usage

Actual Time initialize method is used for `time` attribute, so you can pass just the year or all the way to seconds with fractions and utc offset to the initializer.

```ruby
time = Oletime::Time.new(2016,10,25)
time = Oletime::Time.new(2016,10,25,12,51,34)
time = Oletime::Time.new(2016,10,25,12,51,34,"+02:00")
```

Use `from_ole` to create a new `OleTime::Time` object:

```ruby
time = Oletime::Time.from_ole(42668.535811609)
# => #<Oletime::Time:0x0055de187e76f0 @time=2016-10-25 12:51:34 UTC>
```

Use `to_ole` to get float value of the Time object

```ruby
time = Oletime::Time.new(2016,10,25,12,51,34,"+02:00")
time.to_ole
# => 42668.45247685185
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sandromehic/oletime.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

