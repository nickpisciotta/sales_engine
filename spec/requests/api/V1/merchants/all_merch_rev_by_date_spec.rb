require 'rails_helper'

describe "Merchants Revenue Controller" do
  it "gets merchants total revenue" do
    merchant, merchant2 = create_list(:merchant, 2)
    date = "2012-06-30 14:53:59"

    invoice1 = create(:invoice, merchant: merchant, created_at: date)
    invoice2 = create(:invoice, merchant: merchant2, created_at: date)

    transaction1 = create(:transaction, invoice: invoice1, result: "success", created_at: date)
    invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 1000, created_at: date)

    transaction2 = create(:transaction, invoice: invoice2, result: "success", created_at: date)
    invoice_item1 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 1000, created_at: date)

    get "/api/v1/merchants/revenue", params: { date: date }

    expect(response).to be_success
    expect(response.body).to eq("{\"revenue\":\"40.0\"}")
  end
end
