require 'rails_helper'

describe "Customer Requests" do
  describe "Customers Controller" do
    it 'returns array of all customers' do
      customer_1, customer_2 = create_list(:customer, 2)
      get "/api/v1/customers"

      expect(response).to be_success
      expect(json.count).to eq(2)
      expect(json.first["first_name"]).to eq(customer_1.first_name)
      expect(json.first["last_name"]).to eq(customer_1.last_name)
    end

    it 'returns one customer based on ID' do
      customer_1, customer_2 = create_list(:customer, 2)
      get "/api/v1/customers/#{customer_1.id}"

      expect(response).to be_success
      expect(json["first_name"]).to eq(customer_1.first_name)
      expect(json["first_name"]).to_not eq(customer_2.first_name)
    end
  end
end
