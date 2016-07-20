require 'rails_helper'

describe "Invoice Items, Item Controller" do
  describe 'Gets an item' do
    it 'returns the correct item' do
      item = create(:item, name: "new_item")
      invoice_item = create(:invoice_item, item: item)
      id = invoice_item.id

      get "/api/v1/invoice_items/#{id}/item"

      expect(response).to be_success
      expect(json["name"]).to eq("new_item")
    end
  end
end
