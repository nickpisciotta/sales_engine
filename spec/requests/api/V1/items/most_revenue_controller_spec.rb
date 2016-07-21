require 'rails_helper'

describe "Items, Most Revenue Controller" do
  it "returns items with most revenues depending on quantity params" do
    item1 = create(:item, unit_price: 4000)
    item2 = create(:item, unit_price: 3000)
    item3 = create(:item, unit_price: 2000)
    invoice_item1 = create(:invoice_item, item: item1, unit_price: item1.unit_price)
    invoice_item2 = create(:invoice_item, item: item2, unit_price: item2.unit_price)
    invoice_item3 = create(:invoice_item, item: item3, unit_price: item3.unit_price)

    get "/api/v1/items/most_revenue", params: {quantity: 2}

    expect(response.status).to eq(200)

    expect(json.count).to eq(2)
    expect(json.first["id"]).to eq(item1.id)
    expect(json.first["name"]).to eq(item1.name)
    expect(json.first["description"]).to eq(item1.description)
    expect(json.second["id"]).to eq(item2.id)
  end
end
