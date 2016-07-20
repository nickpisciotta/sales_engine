require 'rails_helper'

describe "Invoices, Customer Controller" do
  it "returns correct customer for an invoice" do
    customer = create(:customer, first_name: "TestCustomer")
    invoice = create(:invoice, customer: customer)
    id = invoice.id

    get "/api/v1/invoices/#{id}/customer"

    expect(response).to be_success
    expect(json['first_name']).to eq("TestCustomer")
  end
end
