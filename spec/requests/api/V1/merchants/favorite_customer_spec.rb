require 'rails_helper'

describe "Favorite Customer" do
  it 'gets a merchants favorite customer' do
    merchant = create(:merchant)
    customer1 = create(:customer, first_name: "FirstCustomer")
    customer2 = create(:customer, first_name: "SecondCustomer")

    invoice1, invoice2 = create_list(:invoice, 2, customer: customer1, merchant: merchant)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1, result: "success")
    transaction2 = create(:transaction, invoice: invoice2, result: "success")
    transaction3 = create(:transaction, invoice: invoice3, result: "success")

    get "/api/v1/merchants/#{merchant.id}/favorite_customer"

    expect(response).to be_success
    expect(json['first_name']).to eq("FirstCustomer")
  end
end
