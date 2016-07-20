require 'rails_helper'

describe "Customer Find All Controller" do
  it "can find all customers based on first name" do
    customer1, customer2, customer3 = create_list(:customer, 3, first_name: "Bob")
    get '/api/v1/customers/find_all', params: {first_name: "Bob"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find all customers based on last name" do
    customer1, customer2, customer3 = create_list(:customer, 3, last_name: "Smith")
    get '/api/v1/customers/find_all', params: {last_name: "Smith"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end


  it "can find a customer based on created_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    customer1, customer2 = create_list(:customer, 2, created_at: time)
    customer_3 = create(:customer, created_at: time2, first_name: "Cust3")

    get '/api/v1/customers/find_all', params: {created_at: time}

    names = json.map {|customer| customer['first_name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Cust3")
  end

  it "can find a customer based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    customer1, customer2 = create_list(:customer, 2, updated_at: time)
    customer_3 = create(:customer, updated_at: time2, first_name: "Cust3")

    get '/api/v1/customers/find_all', params: {updated_at: time}

    names = json.map {|customer| customer['first_name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Cust3")
  end
end
