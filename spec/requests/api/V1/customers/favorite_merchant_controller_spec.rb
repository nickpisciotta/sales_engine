require 'rails_helper'

describe "Customer, Favorite Merchant" do
  it "returns customer favorite merchant for successful transactions" do
    customer1 = create(:customer)
    merchant1 = create(:merchant)
    invoice1 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice2 = create(:invoice, customer: customer1, merchant: merchant1)
    invoice3 = create(:invoice, customer: customer1, merchant: merchant1)
    transaction1 = create(:transaction, invoice: invoice1)
    transaction2 = create(:transaction, invoice: invoice2)
    transaction2 = create(:transaction, invoice: invoice3, result: "failed")

    get "/api/v1/customers/#{customer1.id}/favorite_merchant"

    expect(response.status).to eq(200)
    expect(json.count).to eq(2)
    expect(json["id"]).to eq(merchant1.id)
    expect(json["name"]).to eq(merchant1.name)
  end
end






# transactions.where(result: "success").joins(:invoice).group("invoices.merchant_id").count("invoices.merchant_id")
