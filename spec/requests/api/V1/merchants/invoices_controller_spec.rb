require 'rails_helper'

describe "Merchant Invoices Request" do
  describe "GET #index" do
    it "returns merchants invoices" do
      invoice1, invoice2  = create_list(:invoice, 2)
      merchant_params = {id: invoice1.merchant.id}

      get "/api/v1/merchants/#{invoice1.merchant.id}/invoices", params: {id: merchant_params}

      expect(response.status).to eq(200)

      expect(json.count).to eq(1)
      expect(json.first["id"]).to eq(invoice1.id)
      expect(json.first["status"]).to eq(invoice1.status)
    end
  end
end
