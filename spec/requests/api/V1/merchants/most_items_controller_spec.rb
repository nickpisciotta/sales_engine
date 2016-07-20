require 'rails_helper'

describe "Most Items Controller" do
  describe "finds most items for a merchant" do
    it "successfully gets correct items" do
      merchant1 = create(:merchant, name: "Merch1")
      merchant2 = create(:merchant, name: "Merch2")

      invoice1 = create(:invoice, merchant: merchant1)
      invoice2 = create(:invoice, merchant: merchant1)
      invoice3 = create(:invoice, merchant: merchant2)

      invoice1.transactions << create(:transaction)
      invoice2.transactions << create(:transaction)
      invoice3.transactions << create(:transaction)

      invoice1.invoice_items << create(:invoice_item, quantity: 2)
      invoice2.invoice_items << create(:invoice_item, quantity: 8)
      invoice2.invoice_items << create(:invoice_item, quantity: 4)
      invoice3.invoice_items << create(:invoice_item, quantity: 3)

      get "/api/v1/merchants/most_items", params: {quantity: 2}

      names = json.map {|merchant| merchant['name']}

      expect(response).to be_success
      expect(json.count).to eq(2)
      expect(names).to eq(["Merch1", "Merch2"])

      get "/api/v1/merchants/most_items", params: {quantity: 1}

      expect(json.count).to eq(1)
      expect(json.first['name']).to eq("Merch1")
    end
  end
end
