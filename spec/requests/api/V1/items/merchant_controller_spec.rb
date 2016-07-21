require 'rails_helper'

describe "Items, Merchant Controller" do
    it "returns correct merchant for item" do
      merchant1 = create(:merchant, name: "First Merchant")
      merchant2 = create(:merchant, name: "Second Merchant")

      item = create(:item, merchant: merchant1)

      id = item.id

      get "/api/v1/items/#{id}/merchant"

      expect(response).to be_success
      expect(json['name']).to eq("First Merchant")
      expect(json['name']).to_not eq("Second Merchant")
    end
end
