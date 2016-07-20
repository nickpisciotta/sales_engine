require 'rails_helper'

describe "Invoice Items, Invoice Controller" do
  describe 'Gets an invoice' do
    it 'returns the correct invoice' do
      invoice = create(:invoice, status: "new_invoice")
      invoice_item = create(:invoice_item, invoice: invoice)
      id = invoice_item.id

      get "/api/v1/invoice_items/#{id}/invoice"

      expect(response).to be_success
      expect(json["status"]).to eq("new_invoice")
    end
  end
end
