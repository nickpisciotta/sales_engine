require 'rails_helper'

describe "Find Revenue for a merchant" do
  it "successfully finds total revenue for a merchant" do
    merchant = create(:merchant)
    invoice1, invoice2 = create_list(:invoice, 2, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1, result: "success")
    invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 10)

    transaction2 = create(:transaction, invoice: invoice2, result: "failed")
    invoice_item1 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 10)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success
    expect(response.body).to eq("20")
  end
end
