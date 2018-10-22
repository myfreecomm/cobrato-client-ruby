# Cobrato Client

This is the official Ruby client for the [Cobrato](https://app.cobrato.com) API.

[![Gem Version](https://badge.fury.io/rb/cobrato-client.png)](https://rubygems.org/gems/cobrato-client)
[![Build Status](https://api.travis-ci.org/myfreecomm/cobrato-client-ruby.svg?branch=master)](https://travis-ci.org/myfreecomm/cobrato-client-ruby)
[![Test Coverage](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/coverage)
[![Code Climate Grade](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby/badges/gpa.svg)](https://codeclimate.com/github/myfreecomm/cobrato-client-ruby)
[![Inline docs](http://inch-ci.org/github/myfreecomm/cobrato-client-ruby.svg?branch=master)](http://inch-ci.org/github/myfreecomm/cobrato-client-ruby)

## Compatibility

The Cobrato Ruby Client is compatible with Ruby 2.4.3 or higher.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cobrato-client'
```

And then execute:

```
$ bundle
```

Or install it yourself as:
```
$ gem install cobrato-client
```

## Configuration

Use `Cobrato.configure` to setup your environment:

```ruby
require "cobrato"

Cobrato.configure do |config|
  config.url = "https://sandbox.cobrato.com/api/v1" # defaults to "https://app.cobrato.com.br/api/v1"
  config.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```

## Usage

Given your token, create an instance of `Cobrato::Client`, as below:

```ruby
client = Cobrato.client("YOUR_TOKEN_HERE")
```

Now you have acess to every API endpoint:

* [Payees API](http://docs.cobrato.com/#benefici-rio)
* [Bank Accounts API](http://docs.cobrato.com/#conta-banc-ria)
* [People API](http://docs.cobrato.com/#pessoa)
* [Payers API](http://docs.cobrato.com/#pagador) (DEPRECATED)
* [Charge Configs API](http://docs.cobrato.com/#configura-o-de-cobran-a)
* [Charges API](http://docs.cobrato.com/#cobran-a)
* [Regress Cnab](http://docs.cobrato.com/#cnab-de-retorno)
* [Remittance Cnab](http://docs.cobrato.com/#cnab-de-remessa)
* [CreditCards API](http://docs.cobrato.com/#cart-o-de-cr-dito)
* [Webhooks API](http://docs.cobrato.com/#webhook)
* [Payment Config](http://docs.cobrato.com/#configura-o-de-pagamento) **(BETA)**
* [Payment](http://docs.cobrato.com/#pagamento) **(BETA)**

## Endpoints

#### [Payees](http://docs.cobrato.com/#benefici-rio)

| HTTP method | Endpoint                                                                  | Client method         |
| ----------- | ------------------------------------------------------------------------- | --------------------- |
| POST        | [api/v1/payees](http://docs.cobrato.com/#cria-o-de-benefici-rio)          | client.payees.create  |
| GET         | [api/v1/payees](http://docs.cobrato.com/#lista-de-todos-os-benefici-rios) | client.payees.list    |
| GET         | [api/v1/payees/:id](http://docs.cobrato.com/#informa-es-do-benefici-rio)  | client.payees.show    |
| PUT         | [api/v1/payees/:id](http://docs.cobrato.com/#atualiza-o-de-benefici-rio)  | client.payees.update  |
| DELETE      | [api/v1/payees/:id](http://docs.cobrato.com/#exclus-o-de-benefici-rio)    | client.payees.destroy |

#### [Bank Accounts](http://docs.cobrato.com/#conta-banc-ria)

| HTTP method | Endpoint                                                                               | Client method                        |
| ----------- | -------------------------------------------------------------------------------------- | ------------------------------------ |
| POST        | [api/v1/bank_accounts](http://docs.cobrato.com/#cria-o-de-conta-banc-ria)              | client.bank_accounts.create          |
| GET         | [api/v1/bank_accounts](http://docs.cobrato.com/#lista-de-todas-as-contas-banc-rias)    | client.bank_accounts.list            |
| GET         | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#informa-es-da-conta-banc-ria)      | client.bank_accounts.show            |
| PUT         | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#atualiza-o-de-conta-banc-ria)      | client.bank_accounts.update          |
| DELETE      | [api/v1/bank_accounts/:id](http://docs.cobrato.com/#exclus-o-de-conta-banc-ria)        | client.bank_accounts.destroy         |
| GET         | [api/v1/bank_accounts/portfolio_codes](http://docs.cobrato.com/#carteiras-dispon-veis) | client.bank_accounts.portfolio_codes |

#### [People](http://docs.cobrato.com/#pessoa)

| HTTP method | Endpoint                                                            | Client method         |
| ----------- | --------------------------------------------------------------------| --------------------- |
| POST        | [api/v1/people](http://docs.cobrato.com/#cria-o-de-pessoa)          | client.people.create  |
| GET         | [api/v1/people](http://docs.cobrato.com/#lista-de-todos-as-pessoas) | client.people.list    |
| GET         | [api/v1/people/:id](http://docs.cobrato.com/#informa-es-da-pessoa)  | client.people.show    |
| PUT         | [api/v1/people/:id](http://docs.cobrato.com/#atualiza-o-de-pessoa)  | client.people.update  |

#### [Payers](http://docs.cobrato.com/#pagador) (DEPRECATED)

| HTTP method | Endpoint                                                              | Client method         |
| ----------- | --------------------------------------------------------------------- | --------------------- |
| POST        | [api/v1/payers](http://docs.cobrato.com/#cria-o-de-pagador)           | client.payers.create  |
| GET         | [api/v1/payers](http://docs.cobrato.com/#lista-de-todos-os-pagadores) | client.payers.list    |
| GET         | [api/v1/payers/:id](http://docs.cobrato.com/#informa-es-do-pagador)   | client.payers.show    |
| PUT         | [api/v1/payers/:id](http://docs.cobrato.com/#atualiza-o-de-pagador)   | client.payers.update  |

#### [Charge Configs](http://docs.cobrato.com/#configura-o-de-cobran-a)

| HTTP method | Endpoint                                                                                               | Client method                    |
| ----------- | ------------------------------------------------------------------------------------------------------ | -------------------------------- |
| POST        | [api/v1/charge_configs](http://docs.cobrato.com/#cria-o-de-configura-o-de-cobran-a)                    | client.charge_configs.create     |
| GET         | [api/v1/charge_configs](http://docs.cobrato.com/#lista-de-todas-as-configura-es-de-cobran-a)           | client.charge_configs.list       |
| GET         | [api/v1/charge_configs/:id](http://docs.cobrato.com/#informa-es-de-configura-o-de-cobran-a)            | client.charge_configs.show       |
| PUT         | [api/v1/charge_configs/:id](http://docs.cobrato.com/#atualiza-o-de-configura-o-de-cobran-a)            | client.charge_configs.update     |
| DELETE      | [api/v1/charge_configs/:id](http://docs.cobrato.com/#exclus-o-de-configura-o-de-cobran-a)              | client.charge_configs.destroy    |
| POST        | [api/v1/charge_configs/:id/deactivate](http://docs.cobrato.com/#desativa-o-de-configura-o-de-cobran-a) | client.charge_configs.deactivate |


#### [Charges](http://docs.cobrato.com/#cobran-a)

| HTTP method | Endpoint                                                                                     | Client method                 |
| ----------- | -------------------------------------------------------------------------------------------- | ----------------------------- |
| POST        | [api/v1/charges](http://docs.cobrato.com/#cria-o-de-cobran-a)                                | client.charges.create         |
| GET         | [api/v1/charges](http://docs.cobrato.com/#lista-de-todas-as-cobran-a)                        | client.charges.list           |
| GET         | [api/v1/charges/:id](http://docs.cobrato.com/#informa-es-da-cobran-a)                        | client.charges.show           |
| PUT         | [api/v1/charges/:id](http://docs.cobrato.com/#atualiza-o-de-cobran-a)                        | client.charges.update         |
| DELETE      | [api/v1/charges/:id](http://docs.cobrato.com/#exclus-o-de-cobran-a)                          | client.charges.destroy        |
| POST        | [api/v1/charges/:id/receive](http://docs.cobrato.com/#recebimento-de-cobran-a)               | client.charges.receive        |
| POST        | [api/v1/charges/:id/undo_receive](http://docs.cobrato.com/#desfazer-recebimento-de-cobran-a) | client.charges.undo_receive   |
| POST        | [api/v1/charges/:id/deliver_billet](http://docs.cobrato.com/#envio-de-boleto-da-cobran-a)    | client.charges.deliver_billet |
| GET         | [api/v1/charges/:id/billet](http://docs.cobrato.com/#boleto-da-cobran-a)                     | client.charges.billet         |
| POST        | [api/v1/charges/:id/cancel](http://docs.cobrato.com/#cancelar-cobran-a)                      | client.charges.cancel         |

#### [Regress Cnab](http://docs.cobrato.com/#cnab-de-retorno)

| HTTP method | Endpoint                                                                             | Client method                |
| ----------- | ------------------------------------------------------------------------------------ | ---------------------------- |
| POST        | [api/v1/regress_cnabs](http://docs.cobrato.com/#cria-o-de-cnab-de-retorno)           | client.regress_cnabs.create  |
| GET         | [api/v1/regress_cnabs](http://docs.cobrato.com/#lista-de-todas-as-cnabs-de-retorno)  | client.regress_cnabs.list    |
| GET         | [api/v1/regress_cnabs/:id](http://docs.cobrato.com/#informa-es-do-cnab-de-retorno)   | client.regress_cnabs.show    |
| DELETE      | [api/v1/regress_cnabs/:id](http://docs.cobrato.com/#exclus-o-de-cnab-de-retorno)     | client.regress_cnabs.destroy |
| GET         | [api/v1/regress_cnabs/:id/file](http://docs.cobrato.com/#arquivo-do-cnab-de-retorno) | client.regress_cnabs.file    |

#### [Remittance Cnab](http://docs.cobrato.com/#cnab-de-remessa)

| HTTP method | Endpoint                                                                                                         | Client method                                |
| ----------- | ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| POST        | [api/v1/remittance_cnabs](http://docs.cobrato.com/cria-o-de-arquivo-cnab-de-remessa)                             | client.remittance_cnabs.create               |
| GET         | [api/v1/remittance_cnabs](http://docs.cobrato.com/#lista-de-todas-as-cnabs-de-remessa)                           | client.remittance_cnabs.list                 |
| GET         | [api/v1/remittance_cnabs/:id](http://docs.cobrato.com/#informa-es-do-cnab-de-remessa)                            | client.remittance_cnabs.show                 |
| DELETE      | [api/v1/remittance_cnabs/:id](http://docs.cobrato.com/#exclus-o-de-cnab-de-remessa)                              | client.remittance_cnabs.destroy              |
| GET         | [api/v1/remittance_cnabs/:id/file](http://docs.cobrato.com/#arquivo-do-cnab-de-remessa)                          | client.remittance_cnabs.file                 |
| GET         | [api/v1/remittance_cnabs/:id/charges](http://docs.cobrato.com/#lista-de-todas-as-cobran-a-do-arquivo-de-remessa) | client.remittance_cnabs.charges (DEPRECATED) |
| GET         | [api/v1/remittance_cnabs/:id/items](http://docs.cobrato.com/#lista-de-todos-os-items-do-arquivo-de-remessa)      | client.remittance_cnabs.items                |


#### [Credit Card](http://docs.cobrato.com/#cart-o-de-cr-dito)

| HTTP method | Endpoint                                                                                                               | Client method               |
| ----------- | ---------------------------------------------------------------------------------------------------------------------- | --------------------------- |
| POST        | [api/v1/credit_cards](http://docs.cobrato.com/#cria-o-de-cart-o-de-cr-dito)                                            | client.credit_cards.create  |
| GET         | [api/v1/credit_cards](http://docs.cobrato.com/#lista-dos-cart-es-de-cr-dito)                                           | client.credit_cards.list    |
| GET         | [api/v1/credit_cards/:id](http://docs.cobrato.com/#informa-es-do-cart-o-de-cr-dito)                                    | client.credit_cards.show    |
| GET         | [api/v1/credit_cards/:id/charges](http://docs.cobrato.com/#lista-de-todas-as-cobran-as-feitas-com-o-cart-o-de-cr-dito) | client.credit_cards.charges |

#### [Webhooks](http://docs.cobrato.com/#webhook)

| HTTP method | Endpoint                                                               | Client method           |
| ----------- | ---------------------------------------------------------------------- | ----------------------- |
| POST        | [api/v1/webhooks](http://docs.cobrato.com/#cria-o-de-webhook)          | client.webhooks.create  |
| GET         | [api/v1/webhooks](http://docs.cobrato.com/#lista-de-todos-os-webhooks) | client.webhooks.list    |
| GET         | [api/v1/webhooks/:id](http://docs.cobrato.com/#informa-es-do-webhook)  | client.webhooks.show    |
| PUT         | [api/v1/webhooks/:id](http://docs.cobrato.com/#atualiza-o-de-webhook)  | client.webhooks.update  |
| DELETE      | [api/v1/webhooks/:id](http://docs.cobrato.com/#exclus-o-de-webhook)    | client.webhooks.destroy |

#### [Charging types](http://docs.cobrato.com/#tipos-de-cobran-a)

| HTTP method | Endpoint                                                                              | Client method              |
| ----------- | ------------------------------------------------------------------------------------- | -------------------------- |
| GET         | [api/v1/charging_types](http://docs.cobrato.com/#lista-de-todos-os-tipos-de-cobran-a) | client.changing_types.list |

#### [Charge Template](http://docs.cobrato.com/#modelo-de-cobran-a)

| HTTP method | Endpoint                                                                                  | Client method                   |
| ----------- | ----------------------------------------------------------------------------------------- | ------------------------------- |
| POST        | [api/v1/charge_templates](http://docs.cobrato.com/#cria-o-de-modelo-de-cobran-a)          | client.charge_templates.create  |
| GET         | [api/v1/charge_templates](http://docs.cobrato.com/#lista-de-todos-os-modelos-de-cobran-a) | client.charge_templates.list    |
| GET         | [api/v1/charge_templates/:id](http://docs.cobrato.com/#informa-es-do-modelo-de-cobran-a)  | client.charge_templates.show    |
| PUT         | [api/v1/charge_templates/:id](http://docs.cobrato.com/#atualiza-o-de-modelo-de-cobran-a)  | client.charge_templates.update  |
| DELETE      | [api/v1/charge_templates/:id](http://docs.cobrato.com/#exclus-o-de-modelo-de-cobran-a)    | client.charge_templates.destroy |

#### [Payment Config](http://docs.cobrato.com/#configura-o-de-pagamento) **(BETA)**

| HTTP method | Endpoint                                                                                       | Client method                  |
| ----------- | ---------------------------------------------------------------------------------------------- | ------------------------------ |
| POST        | [api/v1/payment_configs](http://docs.cobrato.com/#cria-o-de-configura-o-de-pagamento)          | client.payment_configs.create  |
| GET         | [api/v1/payment_configs](http://docs.cobrato.com/#lista-de-todas-as-configura-es-de-pagamento) | client.payment_configs.list    |
| GET         | [api/v1/payment_configs/:id](http://docs.cobrato.com/#informa-es-da-configura-o-de-pagamento)  | client.payment_configs.show    |
| PUT         | [api/v1/payment_configs/:id](http://docs.cobrato.com/#atualiza-o-de-configura-o-de-pagamento)  | client.payment_configs.update  |
| DELETE      | [api/v1/payment_configs/:id](http://docs.cobrato.com/#exclus-o-de-configura-o-de-pagamento)    | client.payment_configs.destroy |

#### [Payment](http://docs.cobrato.com/#pagamento) **(BETA)**

| HTTP method | Endpoint                                                                                            | Client method                  |
| ----------- | --------------------------------------------------------------------------------------------------- | ------------------------------ |
| POST        | [api/v1/payments](http://docs.cobrato.com/#cria-o-de-pagamento)                                     | client.payments.create         |
| GET         | [api/v1/payments](http://docs.cobrato.com/#lista-de-todos-os-pagamentos)                            | client.payments.list           |
| GET         | [api/v1/payments/:id](http://docs.cobrato.com/#informa-es-do-pagamento)                             | client.payments.show           |
| PUT         | [api/v1/payments/:id](http://docs.cobrato.com/#atualiza-o-de-pagamento)                             | client.payments.update         |
| DELETE      | [api/v1/payments/:id](http://docs.cobrato.com/#exclus-o-de-pagamento)                               | client.payments.destroy        |
| POST        | [api/v1/payments/:id/cancel](http://docs.cobrato.com/#cancelamento-de-pagamento)                    | client.payments.cancel         |
| GET         | [api/v1/payments/schema](http://docs.cobrato.com/#schema-de-pagamento)                              | client.payments.schema         |
| POST        | [api/v1/payments/:id/unauthorize](http://docs.cobrato.com/#marcar-pagamento-como-n-o-autorizado)    | client.payments.unauthorize    |
| POST        | [api/v1/payments/:id/register_error](http://docs.cobrato.com/#marcar-pagamento-como-n-o-autorizado) | client.payments.register_error |
| POST        | [api/v1/payments/:id/reschedule](http://docs.cobrato.com/#reagendar-pagamento)                      | client.payments.reschedule     |


## Payload signature check

You can check the [Cobrato signature](http://docs.cobrato.com/#assinatura-do-payload) on the payload request:

```ruby
sgnature = Cobrato.signature('secret')
signature.check?(request.headers['X-Cobrato-RequestId'], request.headers['X-Cobrato-Signature'], request.body)
# => true
```

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
* charge_configs
    - cobrato.charge_configs.create
    - cobrato.charge_configs.destroy
* charges
    - cobrato.charges.create
    - cobrato.charges.destroy
    - cobrato.charges.receive
    - cobrato.charges.undo_receive
    - cobrato.charges.cancel
* webhooks
    - cobrato.webhooks.create
    - cobrato.webhooks.destroy
* charge_templates
    - cobrato.charge_templates.create
    - cobrato.charge_templates.destroy

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cobrato-client-ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
