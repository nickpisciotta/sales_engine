class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(Transaction.count)
    respond_with Transaction.offset(random).first
  end
end
