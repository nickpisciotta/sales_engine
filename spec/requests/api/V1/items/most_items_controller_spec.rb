require 'rails_helper'

describe "Items, Most Items Controller" do
  it "returns items with greatest quantity limited by quantity params" do
    item1 = create(:item)
    item2 = create(:item)
    item3 = create(:item)
    invoice_item1 = create(:invoice_item, item: item1, quantity: 4)
    invoice_item2 = create(:invoice_item, item: item2, quantity: 2)
    invoice_item3 = create(:invoice_item, item: item3, quantity: 3)

    get "/api/v1/items/most_items", params: {quantity: 2}

    expect(response.status).to eq(200)

    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(item1.id)
    expect(json.first["name"]).to eq(item1.name)
    expect(json.first["description"]).to eq(item1.description)
    expect(json.second["id"]).to eq(item3.id)
  end
end
