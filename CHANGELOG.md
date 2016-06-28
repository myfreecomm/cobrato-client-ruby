# Changelog

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
