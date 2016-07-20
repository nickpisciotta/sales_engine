require 'rails_helper'

describe "Invoice, TransactionsController" do
  it "returns all items for invoice" do
    invoice = create(:invoice)
    transaction1, transaction2 = create_list(:transaction, 2, result: "Success", invoice: invoice)
    id = invoice.id

    get "/api/v1/invoices/#{id}/transactions"

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(json.first['result']).to eq("Success")
  end
end
