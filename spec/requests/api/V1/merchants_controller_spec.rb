require 'rails_helper'

describe "Merchant Requests" do
  describe "Merchants Controller" do
    it 'returns array of all merchants' do
      merchant_1, merchant_2 = create_list(:merchant, 2)
      get "/api/v1/merchants"

      expect(response).to be_success
      expect(json.count).to eq(2)
      expect(json.first["name"]).to eq(merchant_1.name)
    end

    it 'returns one merchant based on ID' do
      merchant_1, merchant_2 = create_list(:merchant, 2)
      get "/api/v1/merchants/#{merchant_1.id}"

      expect(response).to be_success
      expect(json["name"]).to eq(merchant_1.name)
      expect(json["name"]).to_not eq(merchant_2.name)
    end
  end
end
