require 'rails_helper'

describe "Find Revenue for a merchant" do
  it "successfully finds total revenue for a merchant" do
    merchant = create(:merchant)
    invoice1, invoice2 = create_list(:invoice, 2, merchant: merchant)
    transaction1 = create(:transaction, invoice: invoice1, result: "success")
    invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 1000)

    transaction2 = create(:transaction, invoice: invoice2, result: "failed")
    invoice_item1 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 1000)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    expect(response).to be_success
    expect(response.body).to eq("20.0")
  end

  it 'finds revenue by date' do
    merchant = create(:merchant)
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2012-08-17 14:53:59 UTC'
    invoice1 = create(:invoice, merchant: merchant, created_at: time)
    invoice2 = create(:invoice, merchant: merchant, created_at: time)

    transaction1 = create(:transaction, invoice: invoice1, result: "success", created_at: time)
    invoice_item1 = create(:invoice_item, invoice: invoice1, quantity: 2, unit_price: 1000, created_at: time)

    transaction2 = create(:transaction, invoice: invoice2, result: "success", created_at: time2)
    invoice_item1 = create(:invoice_item, invoice: invoice2, quantity: 2, unit_price: 1000, created_at: time2)

    get "/api/v1/merchants/#{merchant.id}/revenue", params: { date: time }

    expect(response).to be_success
    expect(response.body).to eq("20.0")
  end
end
