[![Build Status](https://travis-ci.org/douglaslise/audited_views.svg?branch=master)](https://travis-ci.org/douglaslise/audited_views)


# AuditedViews
Views to show change logs collected by audited gem.

## Usage
Add this to your `show` views:
```
<%= audited_controls(@product) %>
```
And this to your `index` views:
```
<%= audited_controls(@products) %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'audited_views'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install audited_views
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
