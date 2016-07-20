require 'rails_helper'

describe "Transactions Invoice Request" do
  describe "GET #index" do
    it "returns transactions invoice" do
      transaction1, transaction2 = create_list(:transaction, 2)
      transaction_params = {id: transaction1.id}

      get "/api/v1/transactions/#{transaction1.id}/invoice", params: {id: transaction_params}

      expect(response.status).to eq(200)

      expect(json["status"]).to eq(transaction1.invoice.status)
    end
  end
end
