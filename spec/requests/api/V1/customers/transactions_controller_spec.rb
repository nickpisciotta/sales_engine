require 'rails_helper'

describe "Customer Transactions Request" do
  describe "GET #index" do
    it "returns customers transactions" do
      transaction1, transaction2 = create_list(:transaction, 2)
      customer1_id = transaction1.invoice.customer.id
      customer_params = {id: customer1_id}

      get "/api/v1/customers/#{customer1_id}/transactions", params: {id: customer_params}

      expect(response.status).to eq(200)

      expect(json.count).to eq(1)
      expect(json.first["id"]).to eq(transaction1.id)
      expect(json.first["result"]).to eq(transaction1.result)
    end
  end
end
