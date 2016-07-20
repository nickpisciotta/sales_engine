require 'rails_helper'

describe "Transaction Find All Controller" do
  it "can find all transactions based on invoice id" do
    invoice = create(:invoice)
    transaction1, transaction2, transaction3 = create_list(:transaction, 3, invoice_id: invoice.id)
    get '/api/v1/transactions/find_all', params: {invoice_id: invoice.id}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find all transactions based on result" do
    transaction1, transaction2, transaction3 = create_list(:transaction, 3, result: "success")
    get '/api/v1/transactions/find_all', params: {result: "Success"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find all transactions based on credit_card_number" do
    transaction1, transaction2, transaction3 = create_list(:transaction, 3, credit_card_number: "111222333444")
    get '/api/v1/transactions/find_all', params: {credit_card_number: "111222333444"}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end

  it "can find all transactions based on credit_card_expiration_date" do
    time = "2012-03-27 14:53:59 UTC"
    transaction1, transaction2, transaction3 = create_list(:transaction, 3, credit_card_expiration_date: time)
    get '/api/v1/transactions/find_all', params: {credit_card_expiration_date: time}

    expect(response).to be_success
    expect(json.count).to eq(3)
  end


  it "can find a transaction based on created_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    transaction1, transaction2 = create_list(:transaction, 2, created_at: time)
    transaction_3 = create(:transaction, created_at: time2, result: "Failure")

    get '/api/v1/transactions/find_all', params: {created_at: time}

    results = json.map {|transaction| transaction['result']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(results).to_not include("Failure")
  end

  it "can find a transaction based on updated_at" do
    time = '2012-06-30 14:53:59 UTC'
    time2 = '2014-08-08 14:53:59 UTC'
    transaction1, transaction2 = create_list(:transaction, 2, updated_at: time)
    transaction_3 = create(:transaction, updated_at: time2, result: "failure")

    get '/api/v1/transactions/find_all', params: {updated_at: time}

    results = json.map {|transaction| transaction['result']}

    expect(response).to be_success
    expect(json.count).to eq(2)
    expect(results).to_not include("failure")
  end
end
