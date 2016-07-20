require 'rails_helper'

describe "Invoices, Merchant Controller" do
  it "returns correct merchant for an invoice" do
    merchant = create(:merchant, name: "TestMerchant")
    invoice = create(:invoice, merchant: merchant)
    id = invoice.id

    get "/api/v1/invoices/#{id}/merchant"

    expect(response).to be_success
    expect(json['name']).to eq("TestMerchant")
  end
end
