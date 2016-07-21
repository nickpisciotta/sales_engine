require 'rails_helper'

describe "PendingInvoicesController" do
  it "returns customers with pending invoices" do
    merchant1 = create(:merchant, name: "Merch1")
    customer = create(:customer, first_name: "Customer")
    customer2 = create(:customer, first_name: "NotPendingCustomer")

    invoice1 = create(:invoice, merchant: merchant1, customer: customer)
    invoice2 = create(:invoice, merchant: merchant1, customer: customer2)

    invoice1.transactions << create(:transaction, result: 'failed')
    invoice2.transactions << create(:transaction, result: 'success')

    get "/api/v1/merchants/#{merchant1.id}/customers_with_pending_invoices"

    expect(response).to be_success
    expect(json.count).to eq(1)
    expect(json.first["first_name"]).to eq("Customer")
  end
end
