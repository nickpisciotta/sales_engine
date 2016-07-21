require 'rails_helper'

describe "Transaction Random Controller" do
  it "can find a transaction based on id" do
    transaction1, transaction2, transaction3 = create_list(:transaction, 3)

    get '/api/v1/transactions/random'

    cc_numbers = Transaction.pluck(:credit_card_number)

    expect(response).to be_success
    expect(cc_numbers).to include(json['credit_card_number'])
  end
end
