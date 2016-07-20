require 'rails_helper'

describe "Invoice Items Request" do
  describe "Get #index" do
    it "returns array" do
        invoice_items = create_list(:invoice_item, 3)

        get "/api/v1/invoice_items"

        expect(response.status).to eq(200)

        parsed_items = JSON.parse(response.body)

        expect(parsed_items.count).to eq(3)
    end

    it "returns an invoice_items" do
      invoice_item = create(:invoice_item)

      get "/api/v1/invoice_items/#{invoice_item.id}"

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item.unit_price)
    end

    it "finds an invoice_item given id params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item_params = {id: invoice_item1.id}

      get "/api/v1/invoice_items/find"

      expect(response.status).to eq(200), params: {id: invoice_item1.id}

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item1.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item1.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item1.unit_price)
    end

    it "finds an invoice_item given item_id params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item_params = {item_id: invoice_item1.item.id}

      get "/api/v1/invoice_items/find", params: {item_id: invoice_item_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item1.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item1.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item1.unit_price)
    end

    it "finds an invoice_item given invoice_id params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item_params = {invoice_id: invoice_item1.invoice.id}

      get "/api/v1/invoice_items/find", params: {invoice_id: invoice_item_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item1.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item1.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item1.unit_price)
    end

    it "finds an invoice_item given created_at params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item_params = {created_at: Date.today}

      get "/api/v1/invoice_items/find", params: {created_at: invoice_item_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item1.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item1.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item1.unit_price)
    end

    it "finds an invoice_item given updated_at params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item_params = {updated_at: Date.today}

      get "/api/v1/invoice_items/find", params: {updated_at: invoice_item_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["item_id"]).to eq(invoice_item1.item_id)
      expect(parsed_items["quantity"]).to eq(invoice_item1.quantity)
      expect(parsed_items["unit_price"]).to eq(invoice_item1.unit_price)
    end

    it "finds all invoice_items given item_id params" do
      invoice_item1, invoice_item2 = create_list(:invoice_item, 2)
      invoice_item2.item_id = invoice_item1.item_id
      invoice_item_params = {item_id: invoice_item1.item.id}

      get "/api/v1/invoices/find_all", params: {item_id: invoice_item_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item.count).to eq(2)
    end

    it "returns random invoice" do
      invoice_items = create_list(:invoice_item, 4)

      get "/api/v1/invoice_items/random"

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["item_id"]).to eq(parsed_item['item_id'])
    end

  end
end
