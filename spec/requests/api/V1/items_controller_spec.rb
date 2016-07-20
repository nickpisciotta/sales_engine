require 'rails_helper'

describe "Item Requests" do
  describe "GET #index" do
    it "returns array of all items" do
      items = create_list(:item, 3)

      get "/api/v1/items"

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq(3)
    end

    it "returns an item" do
      item = create(:item)

      get "/api/v1/items/#{item.id}"

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).to eq(item.name)
      expect(parsed_item["description"]).to eq(item.description)
    end

    it "finds an item given id params" do
      item1, item2 = create_list(:item, 2)
      item1_params = {id: item1.id}

      get "/api/v1/items/find", params: {id: item1_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).to eq(item1.name)
      expect(parsed_item["description"]).to eq(item1.description)
    end

    it "finds an item given name params" do
      item1, item2 = create_list(:item, 2)
      item1_params = {name: item1.id}

      get "/api/v1/items/find", params: {name: item1_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).to eq(item1.name)
      expect(parsed_item["description"]).to eq(item1.description)
    end

    it "finds an item given created_at params" do
      item1, item2 = create_list(:item, 2)
      item1_params = {created_at: Date.today}

      get "/api/v1/items/find", params: {created_at: item1_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).to eq(item1.name)
      expect(parsed_item["description"]).to eq(item1.description)
    end

    it "finds an item given updated_at params" do
      item1, item2 = create_list(:item, 2)
      item1_params = {updated_at: Date.today}

      get "/api/v1/items/find", params: {updated_at: item1_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).to eq(item1.name)
      expect(parsed_item["description"]).to eq(item1.description)
    end

    it "finds all items given params" do
      item1, item2 = create_list(:item, 2)
      item1_params = {id: item1.id}

      get "/api/v1/items/find_all", params: {id: item1_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body).first

      expect(parsed_item["name"]).to eq(item1.name)
      expect(parsed_item["description"]).to eq(item1.description)
    end

    it "returns random item" do
      items = create_list(:item, 4)

      get "/api/v1/items/random"

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["name"]).not_to be_empty
      expect(parsed_item["description"]).not_to be_empty
    end
  end
end
