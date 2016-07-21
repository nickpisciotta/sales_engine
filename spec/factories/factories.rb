FactoryGirl.define do

  factory :merchant do
    name {generate(:merchant_name)}
    created_at '2012-03-27 14:53:59 UTC'
    updated_at '2012-06-30 14:53:59 UTC'
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

  factory :invoice do
    customer
    merchant
    status "shipped"
  end

  factory :transaction do
    invoice
    credit_card_number Faker::Business.credit_card_number
    credit_card_expiration_date Faker::Business.credit_card_expiry_date
    result "success"
  end

  factory :item do
    name Faker::Name.title
    description Faker::Hipster.sentence
    unit_price Faker::Number.number(4)
    merchant
  end

  factory :invoice_item do
    item
    invoice
    quantity [1, 2, 3, 4].sample
    unit_price Faker::Number.number(4)
  end
end
