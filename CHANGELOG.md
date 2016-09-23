# Changelog

## Next version

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
