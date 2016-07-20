require 'rails_helper'

describe "Merchant Find Controller" do
  it "can find a merchant based on id" do
    merchant = create(:merchant)
    get '/api/v1/merchants/find', params: {id: merchant.id}

    expect(response).to be_success
    expect(json["id"]).to eq(merchant.id)
  end

  it "can find a merchant based on name" do
    merchant = create(:merchant, name: "MerchantName")
    get '/api/v1/merchants/find', params: {name: "MerchantName"}

    expect(response).to be_success
    expect(json["name"]).to eq("MerchantName")
  end

  it "can find a merchant based on created_at" do
    time = "2012-03-27 14:53:59 UTC"
    merchant = create(:merchant, created_at: time)
    get '/api/v1/merchants/find', params: {created_at: time}

    expect(response).to be_success
    expect(json["created_at"]).to eq("2012-03-27T14:53:59.000Z")
  end

  it "can find a merchant based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    merchant = create(:merchant, updated_at: time)
    get '/api/v1/merchants/find', params: {updated_at: time}

    expect(response).to be_success
    expect(json["updated_at"]).to eq("2012-06-30T14:53:59.000Z")
  end
end
