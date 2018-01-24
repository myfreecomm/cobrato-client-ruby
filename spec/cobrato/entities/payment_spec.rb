require 'spec_helper'

describe Cobrato::Entities::Payment do
  let(:attributes) do
    {
      id: 5,
      payment_config_id: 1,
      payment_type: "provider",
      payment_method: "ted_other_ownership",
      amount: 69.55,
      date: Date.new(2017, 12, 3),
      our_number: "456789",
      registration_status: "without_remittance",

      bank_code: "341",
      payee_document_type: "cpf",
      payee_document: "123.456.789-09",
      payee_name: "John Doe",

      agency: "9358",
      account: "21500",
      account_digit: "3",
      doc_goal: "11",
      ted_goal: "00016",

      discount_amount: 0.5,
      due_date: Date.new(2017, 12, 29),
      barcode: "83630000000 4 25530100000 6 00005094828 0 09112017110 2",

      gps_payment_code: "2580",
      competency_month: "05",
      competency_year: "2018",
      other_entities_amount: 12.31,
      monetary_update: 8.33,

      calculation_period: Date.new(2017, 11, 30),
      receita_federal_code: "0571",
      reference_number: "12",
      mulct_amount: 12.6,
      interest_amount: 22.8,

      gross_revenue: 450.2,
      gross_revenue_percentage: 0.02,

      city_code: 56,
      license_plate: "KQT7890",
      payment_option: "single_with_discount",
      renavam: "345352",
      uf: "rj",

      state_registration: "2313",
      active_debt_registration: "423413",
      installment_number: 5,

      fgts_identifier: "2342",
      connectivity_seal: "3424",
      connectivity_seal_digit: "1",
    }
  end

  subject { described_class.new(attributes) }

  it_behaves_like "entity_attributes",
    [
      # Shared with all
      :id, :payment_config_id, :payment_type, :payment_method, :amount, :date, :registration_status, :our_number,
      :bank_code, :payee_document_type, :payee_document, :payee_name,

      # Shared with some
      :due_date, :calculation_period, :receita_federal_code, :mulct_amount, :interest_amount, :competency_year,
      :discount_amount,

      # Transfer specific
      :agency, :account, :account_digit, :doc_goal, :ted_goal,

      # Billet specific
      :barcode,

      # GPS specific
      :gps_payment_code, :competency_month, :other_entities_amount, :monetary_update,

      # DARF specific
      :reference_number,

      # DAS specific
      :gross_revenue, :gross_revenue_percentage,

      # IPVA specific
      :city_code, :license_plate, :payment_option, :renavam, :uf,

      # ICMS-SP specific
      :state_registration, :active_debt_registration, :installment_number,

      # DPVAT specific
      # --

      # FGTS specific
      :fgts_identifier, :connectivity_seal, :connectivity_seal_digit
    ]
end
