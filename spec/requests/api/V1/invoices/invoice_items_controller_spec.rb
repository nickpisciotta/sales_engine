require 'rails_helper'

describe "Invoice, InvoiceItemsController" do
  it "returns all invoice items for invoice" do
    invoice = create(:invoice)
    invoice_item1, invoice_item2 = create_list(:invoice_item, 2, invoice: invoice, quantity: 4)
    invoice_item3 = create(:invoice_item, quantity: 3)
    id = invoice.id

    get "/api/v1/invoices/#{id}/invoice_items"

    quantities = json.map { |invoice_item| invoice_item['quantity'] }
    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(quantities).to_not include(3)
  end
end
