FactoryGirl.define do

  factory :merchant do
    name {generate(:merchant_name)}
  end

  sequence :merchant_name do |n|
    "Merchant-#{n}"
  end

  factory :customer do
    first_name {generate(:first_name)}
    last_name  {generate(:last_name)}
  end

  sequence :first_name do |n|
    "First-#{n}"
  end

  sequence :last_name do |n|
    "Last-#{n}"
  end

  factory :invoices do
    customer
    merchant
    status "shipped"
  end

  factory :transactions do
    invoices
    credit_card_number Faker::Business.credit_card_number
    expiration_date Faker::Business.credit_card_expiry_date
    result "success"
  end

  factory :item do
    name Faker::Name.title
    description Faker::Hipster.sentence
    unit_price Faker::Number.number(4)
    merchant
  end

  factory :invoice_items do
    item
    invoice
    quantity Faker::Number.number(1)
    unit_price Faker::Number.number(4)
  end
end
