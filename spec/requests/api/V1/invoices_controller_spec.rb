require 'rails_helper'

describe "Invoice Requests" do
  describe "GET #index" do
    it "returns array of all invoices" do
      invoices = create_list(:invoice, 3)

      get "/api/v1/invoices"

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items.count).to eq(3)
    end

    it "returns an invoice" do
      invoice = create(:invoice)

      get "/api/v1/invoices/#{invoice.id}"

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["status"]).to eq(invoice.status)
      expect(parsed_items["customer_id"]).to eq(invoice.customer_id)
      expect(parsed_items["merchant_id"]).to eq(invoice.merchant_id)
    end

    it "finds an invoice given id params" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice1_params = {id: invoice1.id}

      get "/api/v1/invoices/find", params: {id: invoice1_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["status"]).to eq(invoice1.status)
      expect(parsed_items["customer_id"]).to eq(invoice1.customer_id)
      expect(parsed_items["merchant_id"]).to eq(invoice1.merchant_id)
    end

    it "finds an invoice given status params" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice1_params = {status: "shipped"}

      get "/api/v1/invoices/find", params: {status: invoice1_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["status"]).to eq(invoice1.status)
      expect(parsed_items["customer_id"]).to eq(invoice1.customer_id)
      expect(parsed_items["merchant_id"]).to eq(invoice1.merchant_id)
    end

    it "finds an invoice given created_at params" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice1_params = {created_at: Date.today}

      get "/api/v1/invoices/find", params: {created_at: invoice1_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["status"]).to eq(invoice1.status)
      expect(parsed_items["customer_id"]).to eq(invoice1.customer_id)
      expect(parsed_items["merchant_id"]).to eq(invoice1.merchant_id)
    end

    it "finds an invoice given updated_at params" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice1_params = {updated_at: Date.today}

      get "/api/v1/invoices/find", params: {updated_at: invoice1_params}

      expect(response.status).to eq(200)

      parsed_items = JSON.parse(response.body)

      expect(parsed_items["status"]).to eq(invoice1.status)
      expect(parsed_items["customer_id"]).to eq(invoice1.customer_id)
      expect(parsed_items["merchant_id"]).to eq(invoice1.merchant_id)
    end

    it "finds all invoices given shipped params" do
      invoice1, invoice2 = create_list(:invoice, 2)
      invoice_params = {status: "shipped"}

      get "/api/v1/invoices/find_all", params: {status: invoice_params}

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item.count).to eq(2)
    end

    it "returns random invoice" do
      invoices = create_list(:invoice, 4)

      get "/api/v1/invoices/random"

      expect(response.status).to eq(200)

      parsed_item = JSON.parse(response.body)

      expect(parsed_item["status"]).not_to be_empty
    end

  end
end
