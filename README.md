# TTTelematics
A simple ruby API Wrapper for TomTomTelematics

## 1. Quick start

Install via Rubygems

```ruby
gem install tttelematics
```

... or add to Gemfile

```ruby
gem 'tttelematics'
```
use in IRB

```
require 'tttelematics'
```

## 2. Initialize Client

```ruby
client = TTTelematics::API::Client.new('apikey','username','account','password')
```


## 3. Get Objects
For more options [Resources Objects TomTomTelematics](https://telematics.tomtom.com/static/help/webfleet-connect/en_gb/index.htm#Objects.htm).

### 3.1 showObjectReportExtern
[More details](https://telematics.tomtom.com/static/help/webfleet-connect/en_gb/index.htm#showObjectReportExtern.htm)

```ruby
#format = ['json','csv']
#client.asset.objects(options, format)

client.asset({objectno: 'OBJECTID'}, 'json')
or 
asset = client.asset
objects = asset.objects({}, 'json')

asset = TTTelematics::API::Asset.new(client)
objects = asset({objectno: 'OBJECTID'}, 'json') #response a json

array_objects = JSON.parse(objects)
```
## 4. Errors
[More details](https://telematics.tomtom.com/static/help/webfleet-connect/en_gb/index.htm#Responsecodes-wfc.htm)

```ruby
# Common Errors

TTTelematics::Err::InvalidAPIKey -> API key is invalid
TTTelematics::Err::InvalidUser -> User does not exist
TTTelematics::Err::InvalidAction -> Action is not valid


```
