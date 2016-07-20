require 'rails_helper'

describe "Customer Random Controller" do
  it "can find a customer based on id" do
    customer1, customer2, customer3 = create_list(:customer, 3)

    get '/api/v1/customers/random'

    first_names = Customer.pluck(:first_name)

    expect(response).to be_success
    expect(first_names).to include(json['first_name'])
  end
end
