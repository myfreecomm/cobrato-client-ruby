# Cobrato Client

This is the official Ruby client for the [Cobrato](https://app.cobrato.com) API.

[![Gem Version](https://badge.fury.io/rb/cobrato-client.png)](https://rubygems.org/gems/cobrato-client)
[![Build Status](https://api.travis-ci.org/myfreecomm/cobrato-client-ruby.svg?branch=master)](https://travis-ci.org/myfreecomm/cobrato-client-ruby)
[![Test Coverage](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/coverage)
[![Code Climate Grade](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby)
[![Inline docs](http://inch-ci.org/github/myfreecomm/cobrato-client-ruby.svg?branch=master)](http://inch-ci.org/github/myfreecomm/cobrato-client-ruby)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cobrato-client-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cobrato-client-ruby

## Configuration

##### Use Cobrato.configure to setup your environment:

```ruby
require "cobrato"

Cobrato.configure do |config|
  config.url = "https://sandbox.cobrato.com/api/v1" # defaults to "https://app.cobrato.com.br/api/v1"
  config.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```

## Usage

##### Given your token, create an instance of Cobrato::Client, as below:

```ruby
    client = Cobrato.client("YOUR_TOKEN_HERE")
```

##### Now you have acess to every API endpoint:

* [Payees API](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#index)
* [Bank Accounts API](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#index)
* [Charge Accounts API](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#index)
* [Charges API](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#index)
* [Webhooks API](http://myfreecomm.github.io/cobrato/api/v1/webhooks/index.html#index)

## Endpoints

#### [Payees](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#index)

| HTTP method | Endpoint                                                                                 | Client method         |
| ----------- | ---------------------------------------------------------------------------------------- | --------------------- |
| POST        | [api/v1/payees](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#create)     | client.payees.create  |
| GET         | [api/v1/payees](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#list)       | client.payees.list    |
| GET         | [api/v1/payees/:id](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#show)   | client.payees.show    |
| PUT         | [api/v1/payees/:id](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#update) | client.payees.update  |
| DELETE      | [api/v1/payees/:id](http://myfreecomm.github.io/cobrato/api/v1/payees/index.html#delete) | client.payees.destroy |

#### [Bank Accounts](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#index)

| HTTP method | Endpoint                                                                                                                    | Client method                       |
| ----------- | --------------------------------------------------------------------------------------------------------------------------- | ----------------------------------- |
| POST        | [api/v1/bank_accounts](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#create)                          | client.bank_accounts.create         |
| GET         | [api/v1/bank_accounts](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#list)                            | client.bank_accounts.list           |
| GET         | [api/v1/bank_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#show)                        | client.bank_accounts.show           |
| PUT         | [api/v1/bank_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#update)                      | client.bank_accounts.update         |
| DELETE      | [api/v1/bank_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#delete)                      | client.bank_accounts.destroy        |
| GET         | [api/v1/bank_accounts/portfolio_codes](http://myfreecomm.github.io/cobrato/api/v1/bank_accounts/index.html#portfolio_codes) | client.bank_accounts.portfolio_codes |

#### [Charge Accounts](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#index)

| HTTP method | Endpoint                                                                                                   | Client method                  |
| ----------- | ---------------------------------------------------------------------------------------------------------- | ------------------------------ |
| POST        | [api/v1/charge_accounts](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#create)     | client.charge_accounts.create  |
| GET         | [api/v1/charge_accounts](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#list)       | client.charge_accounts.list    |
| GET         | [api/v1/charge_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#show)   | client.charge_accounts.show    |
| PUT         | [api/v1/charge_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#update) | client.charge_accounts.update  |
| DELETE      | [api/v1/charge_accounts/:id](http://myfreecomm.github.io/cobrato/api/v1/charge_accounts/index.html#delete) | client.charge_accounts.destroy |

#### [Charges](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#index)

| HTTP method | Endpoint                                                                                                          | Client method                 |
| ----------- | ----------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| POST        | [api/v1/charges](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#create)                            | client.charges.create         |
| GET         | [api/v1/charges](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#list)                              | client.charges.list           |
| GET         | [api/v1/charges/:id](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#show)                          | client.charges.show           |
| PUT         | [api/v1/charges/:id](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#update)                        | client.charges.update         |
| DELETE      | [api/v1/charges/:id](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#delete)                        | client.charges.destroy        |
| POST        | [api/v1/charges/:id/receive](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#receive)               | client.charges.receive        |
| POST        | [api/v1/charges/:id/undo_receive](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#undo_receive)     | client.charges.undo_receive   |
| POST        | [api/v1/charges/:id/deliver_billet](http://myfreecomm.github.io/cobrato/api/v1/charges/index.html#deliver_billet) | client.charges.deliver_billet |

#### [Webhooks](http://myfreecomm.github.io/cobrato/api/v1/webhooks/index.html#index)

| HTTP method | Endpoint                                                                                      | Client method           |
| ----------- | --------------------------------------------------------------------------------------------- | ----------------------- |
| POST        | [api/v1/webhooks](http://myfreecomm.github.io/cobrato//api/v1/webhooks/index.html#create)     | client.webhooks.create  |
| GET         | [api/v1/webhooks](http://myfreecomm.github.io/cobrato//api/v1/webhooks/index.html#list)       | client.webhooks.list    |
| GET         | [api/v1/webhooks/:id](http://myfreecomm.github.io/cobrato//api/v1/webhooks/index.html#show)   | client.webhooks.show    |
| PUT         | [api/v1/webhooks/:id](http://myfreecomm.github.io/cobrato//api/v1/webhooks/index.html#update) | client.webhooks.update  |
| DELETE      | [api/v1/webhooks/:id](http://myfreecomm.github.io/cobrato//api/v1/webhooks/index.html#delete) | client.webhooks.destroy |

#### [Webhooks](#todo)

| HTTP method | Endpoint            | Client method           |
| ----------- | ------------------- | ----------------------- |
| POST        | [api/v1/webhooks](#todo)     | client.webhooks.create  |
| GET         | [api/v1/webhooks](#todo)     | client.webhooks.list    |
| GET         | [api/v1/webhooks/:id](#todo) | client.webhooks.show    |
| PUT         | [api/v1/webhooks/:id](#todo) | client.webhooks.update  |
| DELETE      | [api/v1/webhooks/:id](#todo) | client.webhooks.destroy |

## Callbacks

All actions that change data triggers an event that you can subscribe to. This event allow you to extend the logic executed when you call a client method.

#### Subscribing to an event

All you have to do is create a class that responds to a method `#call` with two arguments:

```ruby
class MyListener
  def call(result, args)
  end
end
```

**Where:**

* `result` is the return of a client method
* `args` is an array of arguments passed to the client method you called

Now you have a listener, you can subscribe to an event:

```ruby
Cobrato.subscribe("cobrato.payees.destroy", MyListener.new)
```

**Example:**

When you call `client.payees.destroy(1)`, an event `cobrato.payees.destroy` will be triggered. Your listener method `#call` will receive:

* `result` would be `true or false` - depending on what `client.payees.destroy(1)` returned
* `args` would be `[1]` - an array with the arguments passed to the client method

#### Available hooks

* payees
    - cobrato.payees.create
    - cobrato.payees.destroy
* bank_accounts
    - cobrato.bank_accounts.create
    - cobrato.bank_accounts.destroy
* charge_accounts
    - cobrato.charge_accounts.create
    - cobrato.charge_accounts.destroy
* charges
    - cobrato.charges.create
    - cobrato.charges.destroy
    - cobrato.charges.receive
    - cobrato.charges.undo_receive
* webhooks
    - cobrato.webhooks.create
    - cobrato.webhooks.destroy

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cobrato-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
