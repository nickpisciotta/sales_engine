require 'rails_helper'

describe "Customer Find All Controller" do
  it "can find all customers based on name" do
    customer1, customer2, customer3 = create_list(:customer, 3, name: "CustomerName")
    get '/api/v1/customers/find_all', params: {name: "CustomerName"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find a customer based on created_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    customer1, customer2 = create_list(:customer, 2, created_at: time)
    customer_3 = create(:customer, created_at: time2, name: "Merch3")

    get '/api/v1/customers/find_all', params: {created_at: time}

    names = json.map {|customer| customer['name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Merch3")
  end

  it "can find a customer based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    customer1, customer2 = create_list(:customer, 2, updated_at: time)
    customer_3 = create(:customer, updated_at: time2, name: "Merch3")

    get '/api/v1/customers/find_all', params: {updated_at: time}

    names = json.map {|customer| customer['name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Merch3")
  end
end
