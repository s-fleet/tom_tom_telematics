# TTTelematics
A simple ruby API Wrapper for TomTomTelematics

# Quick start

Install via Rubygems

```ruby
gem install tttelematics
```

... or add to Gemfile

```ruby
gem 'tttelematics'
```

# Initialize Client

```ruby
client = TTTelematics::API::Client.new('apikey','username','account','password')
```


# Get Objects

```ruby
client.objects({})
```
