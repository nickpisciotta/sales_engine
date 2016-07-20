require 'rails_helper'

describe "Transactions Find Controller" do
  it "can find a transaction based on id" do
    transaction = create(:transaction)
    get '/api/v1/transactions/find', params: {id: transaction.id}

    expect(response).to be_success
    expect(json["id"]).to eq(transaction.id)
  end

  it "can find a transaction based on invoice id" do
    transaction = create(:transaction)
    get '/api/v1/transactions/find', params: {invoice_id: transaction.invoice.id}

    expect(response).to be_success
    expect(json["invoice_id"]).to eq(transaction.invoice.id)
  end

  it "can find a transaction based on credit card number" do
    transaction = create(:transaction, credit_card_number: "111222333444")
    get '/api/v1/transactions/find', params: {credit_card_number: "111222333444"}

    expect(response).to be_success
    expect(json["credit_card_number"]).to eq("111222333444")
  end

  it "can find a transaction based on result" do
    transaction = create(:transaction, result: "success")
    get '/api/v1/transactions/find', params: {result: "success"}

    expect(response).to be_success
    expect(json["result"]).to eq("success")
  end

  it "can find a transaction based on credit_card_expiration_date" do
    time = "2012-03-27 14:53:59 UTC"
    transaction = create(:transaction, credit_card_expiration_date: time)
    get '/api/v1/transactions/find', params: {credit_card_expiration_date: time}

    expect(response).to be_success
    expect(json["credit_card_expiration_date"]).to eq("2012-03-27 14:53:59 UTC")
  end

  it "can find a transaction based on created_at" do
    time = "2012-03-27 14:53:59 UTC"
    transaction = create(:transaction, created_at: time)
    get '/api/v1/transactions/find', params: {created_at: time}

    expect(response).to be_success
    expect(json["created_at"]).to eq("2012-03-27T14:53:59.000Z")
  end

  it "can find a transaction based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    transaction = create(:transaction, updated_at: time)
    get '/api/v1/transactions/find', params: {updated_at: time}

    expect(response).to be_success
    expect(json["updated_at"]).to eq("2012-06-30T14:53:59.000Z")
  end
end
