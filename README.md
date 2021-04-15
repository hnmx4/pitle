# Pitle

pick + tilte = pitle

Pick the one filename from duplicate filenames that have different extensions.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pitle'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pitle

## Usage

For example:

    $ pitle -e epub,pdf,mobi

### Command Options

`--extension, -e`

Specify the target extensions. Do not put a space after the colon.

For example:

    $ pitle -e epub,pdf,mobi

`--print0, -0`

Print the full file name, followed by a null character instead of a newline.

For example:

    $ pitle -e epub,pdf,mobi --print0

Advanced usage:

    $ pitle -e epub,pdf,mobi --print0 | xargs -0 -J % cp % ./dst

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pitle. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/pitle/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pitle project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pitle/blob/master/CODE_OF_CONDUCT.md).
