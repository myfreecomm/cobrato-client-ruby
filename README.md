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
gem 'cobrato-client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cobrato-client

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

* [Payees API](http://docs.cobrato.com/#beneficiário)
* [Bank Accounts API](http://docs.cobrato.com/#conta-bancária)
* [Charge Accounts API](http://docs.cobrato.com/#conta-de-cobrança)
* [Charges API](http://docs.cobrato.com/#cobrança)
* [Regress Cnab](http://docs.cobrato.com/#cnab-de-retorno)
* [Remittance Cnab](http://docs.cobrato.com/#cnab-de-remessa)
* [Webhooks API](http://docs.cobrato.com/#webhook)

## Endpoints

#### [Payees](http://docs.cobrato.com/#beneficiário)

| HTTP method | Endpoint                                                                  | Client method         |
| ----------- | ------------------------------------------------------------------------- | --------------------- |
| POST        | [api/v1/payees](http://docs.cobrato.com/#criação-de-beneficiário)         | client.payees.create  |
| GET         | [api/v1/payees](http://docs.cobrato.com/#lista-de-todos-os-beneficiários) | client.payees.list    |
| GET         | [api/v1/payees/:id](http://docs.cobrato.com/#informações-do-beneficiário) | client.payees.show    |
| PUT         | [api/v1/payees/:id](http://docs.cobrato.com/#atualização-de-beneficiário) | client.payees.update  |
| DELETE      | [api/v1/payees/:id](http://docs.cobrato.com/#exclusão-de-beneficiário)    | client.payees.destroy |

#### [Bank Accounts](http://docs.cobrato.com/#conta-bancária)

| HTTP method | Endpoint                                                                               | Client method                        |
| ----------- | -------------------------------------------------------------------------------------- | ------------------------------------ |
| POST        | [api/v1/bank_accounts](http://docs.cobrato.com/#criação-de-conta-bancária)             | client.bank_accounts.create          |
| GET         | [api/v1/bank_accounts](http://docs.cobrato.com/#lista-de-todas-as-contas-bancárias)    | client.bank_accounts.list            |
| GET         | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#informações-da-conta-bancária)     | client.bank_accounts.show            |
| PUT         | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#atualização-de-conta-bancária)     | client.bank_accounts.update          |
| DELETE      | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#exclusão-de-conta-bancária)        | client.bank_accounts.destroy         |
| GET         | [api/v1/bank_accounts/portfolio_codes](http://docs.cobrato.com/#carteiras-disponíveis) | client.bank_accounts.portfolio_codes |

#### [Charge Accounts](http://docs.cobrato.com/#conta-de-cobrança)

| HTTP method | Endpoint                                                                                | Client method                  |
| ----------- | --------------------------------------------------------------------------------------- | ------------------------------ |
| POST        | [api/v1/charge_accounts](http://docs.cobrato.com/#criação-de-conta-de-cobrança)         | client.charge_accounts.create  |
| GET         | [api/v1/charge_accounts](http://docs.cobrato.com/#lista-de-todas-as-contas-de-cobrança) | client.charge_accounts.list    |
| GET         | [api/v1/charge_accounts/:id](http://docs.cobrato.com/#informações-da-conta-de-cobrança) | client.charge_accounts.show    |
| PUT         | [api/v1/charge_accounts/:id](http://docs.cobrato.com/#atualização-de-conta-de-cobrança) | client.charge_accounts.update  |
| DELETE      | [api/v1/charge_accounts/:id](http://docs.cobrato.com/#exclusão-de-conta-de-cobrança)    | client.charge_accounts.destroy |

#### [Charges](http://docs.cobrato.com/#cobrança)

| HTTP method | Endpoint                                                                                     | Client method                 |
| ----------- | -------------------------------------------------------------------------------------------- | ----------------------------- |
| POST        | [api/v1/charges](http://docs.cobrato.com/#criação-de-cobrança)                               | client.charges.create         |
| GET         | [api/v1/charges](http://docs.cobrato.com/#lista-de-todas-as-cobrança)                        | client.charges.list           |
| GET         | [api/v1/charges/:id](http://docs.cobrato.com/#informações-da-cobrança)                       | client.charges.show           |
| PUT         | [api/v1/charges/:id](http://docs.cobrato.com/#atualização-de-cobrança)                       | client.charges.update         |
| DELETE      | [api/v1/charges/:id](http://docs.cobrato.com/#exclusão-de-cobrança)                          | client.charges.destroy        |
| POST        | [api/v1/charges/:id/receive](http://docs.cobrato.com/#recebimento-de-cobrança)               | client.charges.receive        |
| POST        | [api/v1/charges/:id/undo_receive](http://docs.cobrato.com/#desfazer-recebimento-de-cobrança) | client.charges.undo_receive   |
| POST        | [api/v1/charges/:id/deliver_billet](http://docs.cobrato.com/#envio-de-boleto-da-cobrança)    | client.charges.deliver_billet |
| GET         | [api/v1/charges/:id/billet](http://docs.cobrato.com/#boleto-da-cobrança)                     | client.charges.billet         |

#### [Regress Cnab](http://docs.cobrato.com/#cnab-de-retorno)

| HTTP method | Endpoint                                                                             | Client method                |
| ----------- | ------------------------------------------------------------------------------------ | ---------------------------- |
| POST        | [api/v1/regress_cnabs](http://docs.cobrato.com/#criação-de-cnab-de-retorno)          | client.regress_cnabs.create  |
| GET         | [api/v1/regress_cnabs](http://docs.cobrato.com/#lista-de-todas-as-cnabs-de-retorno)  | client.regress_cnabs.list    |
| GET         | [api/v1/regress_cnabs/:id](http://docs.cobrato.com/#informações-do-cnab-de-retorno)  | client.regress_cnabs.show    |
| DELETE      | [api/v1/regress_cnabs/:id](http://docs.cobrato.com/#exclusão-de-cnab-de-retorno)     | client.regress_cnabs.destroy |
| GET         | [api/v1/regress_cnabs/:id/file](http://docs.cobrato.com/#arquivo-do-cnab-de-retorno) | client.regress_cnabs.file    |

#### [Remittance Cnab](http://docs.cobrato.com/#cnab-de-remessa)

| HTTP method | Endpoint                                                                                                         | Client method                   |
| ----------- | ---------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| POST        | [api/v1/remittance_cnabs](http://docs.cobrato.com/##criação-de-arquivo-cnab-de-remessa)                          | client.remittance_cnabs.create  |
| GET         | [api/v1/remittance_cnabs](http://docs.cobrato.com/#lista-de-todas-as-cnabs-de-remessa)                           | client.remittance_cnabs.list    |
| GET         | [api/v1/remittance_cnabs/:id](http://docs.cobrato.com/#informações-do-cnab-de-remessa)                           | client.remittance_cnabs.show    |
| DELETE      | [api/v1/remittance_cnabs/:id](http://docs.cobrato.com/#exclusão-de-cnab-de-remessa)                              | client.remittance_cnabs.destroy |
| GET         | [api/v1/remittance_cnabs/:id/file](http://docs.cobrato.com/#arquivo-do-cnab-de-remessa)                          | client.remittance_cnabs.file    |
| GET         | [api/v1/remittance_cnabs/:id/charges](http://docs.cobrato.com/#lista-de-todas-as-cobrança-do-arquivo-de-remessa) | client.remittance_cnabs.charges |

#### [Webhooks](http://docs.cobrato.com/#webhook)

| HTTP method | Endpoint                                                               | Client method           |
| ----------- | ---------------------------------------------------------------------- | ----------------------- |
| POST        | [api/v1/webhooks](http://docs.cobrato.com/#criação-de-webhook)         | client.webhooks.create  |
| GET         | [api/v1/webhooks](http://docs.cobrato.com/#lista-de-todos-os-webhooks) | client.webhooks.list    |
| GET         | [api/v1/webhooks/:id](http://docs.cobrato.com/#informações-do-webhook) | client.webhooks.show    |
| PUT         | [api/v1/webhooks/:id](http://docs.cobrato.com/#atualização-de-webhook) | client.webhooks.update  |
| DELETE      | [api/v1/webhooks/:id](http://docs.cobrato.com/#exclusão-de-webhook)    | client.webhooks.destroy |

#### [Charging types](http://docs.cobrato.com/#tipos-de-cobrança)

| HTTP method | Endpoint                                                                              | Client method              |
| ----------- | ------------------------------------------------------------------------------------- | -------------------------- |
| GET         | [api/v1/charging_types](http://docs.cobrato.com/#lista-de-todos-os-tipos-de-cobrança) | client.changing_types.list |

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
