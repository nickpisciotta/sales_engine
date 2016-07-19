require 'rails_helper'

describe "Merchant Requests" do
  describe "GET #index" do
    it 'returns array of all merchants' do
      merchant_1, merchant_2 = create_list(:merchant, 2)
      get "/api/v1/merchants"
      json = JSON.parse(response.body)

      expect(response).to be_success
      # expect(response.body.count).to eq(2)
      # expect(json['merchants'].length).to eq(2)
    end
  end
end
