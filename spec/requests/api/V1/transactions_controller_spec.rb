require 'rails_helper'

describe "Transaction Requests" do
  describe "Transactions Controller" do
    it 'returns array of all transactions' do
      transaction_1 = create(:transaction, result: "Success")
      transaction_2 = create(:transaction, result: "Failure")
      get "/api/v1/transactions"

      expect(response).to be_success
      expect(json.count).to eq(2)
      expect(json.first["result"]).to eq("Success")
      expect(json.last["result"]).to eq("Failure")
    end

    it 'returns one transaction based on ID' do
      transaction_1 = create(:transaction, result: "Success")
      transaction_2 = create(:transaction, result: "Failure")

      get "/api/v1/transactions/#{transaction_1.id}"

      expect(response).to be_success
      expect(json["result"]).to eq("Success")
      expect(json["result"]).to_not eq(transaction_2.result)
    end
  end
end
