require 'rails_helper'

describe "Customer Invoices Request" do
  describe "GET #index" do
    it "returns customers invoices" do
      invoice1, invoice2 = create_list(:invoice, 2)
      customer1_id = invoice1.customer.id
      customer_params = {id: customer1_id}

      get "/api/v1/customers/#{customer1_id}/invoices", params: {id: customer_params}

      expect(response.status).to eq(200)

      expect(json.count).to eq(1)
      expect(json.first["status"]).to eq(invoice1.status)
      expect(json.first["customer_id"]).to eq(customer1_id)
    end
  end
end
