require 'rails_helper'

describe "Merchant Items Request" do
  describe "GET #index" do
    it "returns merchants items" do
      item1, item2  = create_list(:item, 2)
      merchant_params = {id: item1.merchant.id}

      get "/api/v1/merchants/#{item1.merchant.id}/items", params: {id: merchant_params}

      expect(response.status).to eq(200)

      expect(json.count).to eq(1)
      expect(json.first["name"]).to eq(item1.name)
      expect(json.first["description"]).to eq(item1.description)
    end
  end
end
