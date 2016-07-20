require 'rails_helper'

describe "Merchant Find All Controller" do
  it "can find all merchants based on name" do
    merchant1, merchant2, merchant3 = create_list(:merchant, 3, name: "MerchantName")
    get '/api/v1/merchants/find_all', params: {name: "MerchantName"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find a merchant based on created_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    merchant1, merchant2 = create_list(:merchant, 2, created_at: time)
    merchant_3 = create(:merchant, created_at: time2, name: "Merch3")

    get '/api/v1/merchants/find_all', params: {created_at: time}

    names = json.map {|merchant| merchant['name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Merch3")
  end

  it "can find a merchant based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    merchant1, merchant2 = create_list(:merchant, 2, updated_at: time)
    merchant_3 = create(:merchant, updated_at: time2, name: "Merch3")

    get '/api/v1/merchants/find_all', params: {updated_at: time}

    names = json.map {|merchant| merchant['name']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(names).to_not include("Merch3")
  end
end
