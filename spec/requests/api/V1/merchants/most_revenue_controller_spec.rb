require 'rails_helper'

describe "Most Revenue Controller" do
  it "returns top merchants by revenue" do
    merchant1 = create(:merchant, name: "Merch1")
    merchant2 = create(:merchant, name: "Merch2")

    invoice1 = create(:invoice, merchant: merchant1)
    invoice2 = create(:invoice, merchant: merchant2)

    transaction1 = create(:transaction, invoice: invoice1, result: "success")
    invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 8000)

    transaction2 = create(:transaction, invoice: invoice2, result: "success")
    invoice_item1 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 1000)

    get '/api/v1/merchants/most_revenue', params: {quantity: 1}

    expect(response).to be_success
    expect(json.count).to eq(1)
    expect(json.first['name']).to eq("Merch1")
  end
end
