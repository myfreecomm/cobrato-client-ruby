# Changelog

## Next version

## v0.23.0.beta8

- Add support to cancel payment

## v0.23.0.beta7

- Add ICMS-SP payment Support
- Add DPVAT payment Support
- Add FGTS payment Support

## v0.23.0.beta6

- Add DAS payment Support
- Add IPVA payment Support

## v0.23.0.beta5

- Add Billet payment support
- Add GPS payment support
- Add DARF payment support

## v0.23.0.beta4

- Add changes on RegressCnab API:
  - The use of `charge_config_id` for RemittanceCnab creation is now DEPRECATED. Use `config_id` instead.
  - `RegressCnab#charge_config_id` is DEPRECATED. Use `RegressCnab#config_id` instead.
  - Add `RegressCnab#type`.
  - Remove `RegressCnab#report`.
- Add `RemittanceCnab#type`

## v0.23.0.beta3

- Add `writing_off_deadline` to `ChargeConfig` entity.

## v0.23.0.beta2

- Add Payment API support.
- Add changes on RemittanceCnab API:
  - `remittance_cnabs#charges` is now DEPRECATED. Use `remittance_cnabs#items` instead.
  - The use of `charge_config_ids` and `charge_ids` for RemittanceCnab creation is now DEPRECATED. Use `config_ids` and `item_ids` instead.
  - `RemittanceCnab#charge_config_id` is DEPRECATED. Use `RemittanceCnab#config_id` instead.

## v0.23.0.beta1

- Add PaymentConfig API suppport

## v0.22.0

- Treat error at billet endpoint
- Add `available_billet` to Charge entity

## v0.21.0

- Add `credit_cards#update` endpoint

## v0.20.0

- Add `payee_id` to `ChargeConfig` entity and it is a mandatory attribute.
- Use rack style for pair params encoding.

## v0.19.0

- Add `email_reply_to` to `ChargeTemplate` entity.

## v0.18.0

- Add `charges#revoke` endpoint
- Change the `charges#cancel` endpoint to return a `Charge` entity intead of a boolean

## v0.17.0

- Add `paid_discount`, `paid_addition`, `paid_rebate` to Charge entity
- Add `paid_difference` (vitual attribute) to Charge entity

## v0.16.0

- Add `auto_send_billet` to Charge entity
- Add `email_sender_name` to Charge entity
- Add `email_subject` to Charge entity
- Add `email_text` to Charge entity
- Add `charge_template_id` to Charge entity

- Add `email_sender_name` to ChargeTemplate entity
- Add `email_subject` to ChargeTemplate entity
- Add `email_text` to ChargeTemplate entity

## v.15.0

- Add `url` method to Entities.

## v0.14.0

- Remove `charge_template_id` from `Charge`. It is a parameter only used on `Charge` create API.

## v0.13.0

- Add `charge_template_id` to `Charge`
- Add `ChargeTemplate` API

## v0.12.0

- Add `Charge#payment_tax`
- Remove `Charge#received` # but still there as deprecated
- Rename `Charge#total_amount` to `Charge#charged_amount` # but still there as deprecated
- Rename `Charge#received_amount` to `Charge#paid_amount` # but still there as deprecated
- Rename `Charge#received_at` to `Charge#paid_at` # but still there as deprecated

## v0.11.0

- Add charge_config#pre_released_billet

## v0.10.0

- Add charges#renew endpoint

## v0.9.1

- Add `canceled_at` to `Charge`

## v0.9.0

- Attribute `payer_emails` from `Charge` renamed to  `notification_emails`

## v0.8.0

- Remove `CreditCard#reusable`

## v0.7.0

- Attribute `agreement_number` from `ChargeConfig` renamed to `remittance_agreement_code`.

## v0.6.0

- Attributes `interest_amount_per_month`, `mulct_type`, `mulct_value` were moved from ChargeConfig to Charge.

## v0.5.0

- The `Charge#generate_token ` was removed and `CreditCard#created_as_reusable` was added with the same goal.
- Add credit_cards#create endpoint
- Add credit_cards#list endpoint
- Add credit_cards#show endpoint
- Add credit_cards#charges endpoint

## v0.3.0

### Structural changes

To open the path for new charging methods beyond Bank Billet, we made some structural changes:

#### `ChargeAccount` is now `ChargeConfig`

`ChargeAccount` is now `ChargeConfig` and have new attributes:

- `type`: the only possible value at this moment is `"billet"` that is the default value

#### Changes on `Charge`

##### Changed `Charge` attribute names

- `Charge#status` now is `Charge#registration_status`
- `Charge#registered` now is `Charge#registrable`
- `Charge#charge_account_id` now is `Charge#charge_config_id`

##### Removed `Charge` attributes

- `Charge#has_cnab_remittance`

##### Added `Charge` attributes

- `type`: the only possible value at this moment is `"billet"`

##### Changed `Charge#registration_status` (old `Charge#status`) names

- `"not_generated_remittance"` is now `"without_remittance"`
- `"generated_remittance"` is now `"remitted"`
- `"registered"` stays the same
- `"registered_with_error"` was added

#### Changes on `RegressCnab`

##### Changed `RegressCnab` attribute names

- `RegressCnab#charge_account_id` now is `RegressCnab#charge_config_id`

#### Changes on `RemittanceCnab`

##### Changed `RemittanceCnab` attribute names

- `RemittanceCnab#charge_account_id` now is `RemittanceCnab#charge_config_id`


## v0.2.11

### Add `ChargeAccount` attributes:

- `transmission-code`: it is a remittance related attribute only used by billet ChargeConfig for Santander bank
