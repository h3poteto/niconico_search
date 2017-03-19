# NiconicoSearch

This gem is a api client for niconico snapshot search api v2.
Please check this api document: http://site.nicovideo.jp/search-api-docs/snapshot.html

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'niconico_search'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install niconico_search

## Usage

```ruby
client = NiconicoSearch.new("your_application_name")
results = nico.search(
  query: keyword,
  targets: [:title, :description, :tags],
  options: {
    _limit: 50,
    "filters[start_time][gte]" => Time.current.yesterday.beginning_of_day.strftime("%Y-%m-%dT%H:%M:%S%:z"),
    "filters[start_time][lte]" => Time.current.beginning_of_day.strftime("%Y-%m-%dT%H:%M:%S%:z")
  }
)
```
`options` filed contains `fields`, `filters`, `_sort`, `_offset`, and `_limit`, please check [api document](http://site.nicovideo.jp/search-api-docs/snapshot.html) about options and other parameters.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/h3poteto/niconico_search. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

