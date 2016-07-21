require 'rails_helper'

describe "Merchant Random Controller" do
  it "can find a merchant based on id" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3)

    get '/api/v1/merchants/random'

    names = Merchant.pluck(:name)

    expect(response).to be_success
    expect(names).to include(json['name'])
  end
end
