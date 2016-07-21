require 'rails_helper'

describe "Invoice, ItemsController" do
  it "returns all items for invoice" do
    invoice = create(:invoice)
    item1 = create(:item, name: "ItemOne")
    item2 = create(:item, name: "ItemTwo")
    invoice_item1 = create(:invoice_item, invoice: invoice, item: item1)
    invoice_item2 = create(:invoice_item, invoice: invoice, item: item2)
    id = invoice.id

    get "/api/v1/invoices/#{id}/items"

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(json.first['name']).to eq("ItemOne")
    expect(json.last['name']).to eq("ItemTwo")
  end
end
