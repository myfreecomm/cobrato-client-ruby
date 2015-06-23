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

#### [Payees](#todo)

| HTTP method | Endpoint          | Client method         |
| ----------- | ----------------- | --------------------- |
| POST        | api/v1/payees     | client.payees.create  |
| GET         | api/v1/payees     | client.payees.list    |
| GET         | api/v1/payees/:id | client.payees.show    |
| PUT         | api/v1/payees/:id | client.payees.update  |
| DELETE      | api/v1/payees/:id | client.payees.destroy |

#### [Bank Accounts](#todo)

| HTTP method | Endpoint                             | Client method                       |
| ----------- | ------------------------------------ | ----------------------------------- |
| POST        | api/v1/bank_accounts                 | client.bank_accounts.create         |
| GET         | api/v1/bank_accounts                 | client.bank_accounts.list           |
| GET         | api/v1/bank_accounts/:id             | client.bank_accounts.show           |
| PUT         | api/v1/bank_accounts/:id             | client.bank_accounts.update         |
| DELETE      | api/v1/bank_accounts/:id             | client.bank_accounts.destroy        |
| GET         | api/v1/bank_accounts/portfolio_codes | client.bank_accounts.porfolio_codes |

#### [Charge Accounts](#todo)

| HTTP method | Endpoint                   | Client method                  |
| ----------- | -------------------------- | ------------------------------ |
| POST        | api/v1/charge_accounts     | client.charge_accounts.create  |
| GET         | api/v1/charge_accounts     | client.charge_accounts.list    |
| GET         | api/v1/charge_accounts/:id | client.charge_accounts.show    |
| PUT         | api/v1/charge_accounts/:id | client.charge_accounts.update  |
| DELETE      | api/v1/charge_accounts/:id | client.charge_accounts.destroy |

#### [Charges](#todo)

| HTTP method | Endpoint                          | Client method                 |
| ----------- | --------------------------------- | ----------------------------- |
| POST        | api/v1/charges                    | client.charges.create         |
| GET         | api/v1/charges                    | client.charges.list           |
| GET         | api/v1/charges/:id                | client.charges.show           |
| PUT         | api/v1/charges/:id                | client.charges.update         |
| DELETE      | api/v1/charges/:id                | client.charges.destroy        |
| POST        | api/v1/charges/:id/receive        | client.charges.receive        |
| POST        | api/v1/charges/:id/undo_receive   | client.charges.undo_receive   |
| POST        | api/v1/charges/:id/deliver_billet | client.charges.deliver_billet |

#### [Webhooks](#todo)

| HTTP method | Endpoint            | Client method           |
| ----------- | ------------------- | ----------------------- |
| POST        | api/v1/webhooks     | client.webhooks.create  |
| GET         | api/v1/webhooks     | client.webhooks.list    |
| GET         | api/v1/webhooks/:id | client.webhooks.show    |
| PUT         | api/v1/webhooks/:id | client.webhooks.update  |
| DELETE      | api/v1/webhooks/:id | client.webhooks.destroy |

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cobrato-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
