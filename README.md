# Cobrato::Client::Ruby

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cobrato/client/ruby`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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
  #TODO configuration
end
```

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

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cobrato-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
