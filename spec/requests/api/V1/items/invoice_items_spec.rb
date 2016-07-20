require 'rails_helper'

describe "Items, Invoice Item Controller" do
  describe "returns collection of invoice items" do
    it "returns correct invoice items" do
      item = create(:item, name: "test_item")
      item2 = create(:item, name: "other_item")

      invoice_item1, invoice_item2 = create_list(:invoice_item, 2, item: item, quantity: 3)
      invoice_item3 = create(:invoice_item, item: item2, quantity: 6)

      id = item.id

      get "/api/v1/items/#{id}/invoice_items"

      quantities = json.map {|invoice_item| invoice_item['quantity'] }
      expect(response).to be_success
      expect(json.count).to eq(2)
      expect(quantities).to_not include(6)
    end
  end
end
