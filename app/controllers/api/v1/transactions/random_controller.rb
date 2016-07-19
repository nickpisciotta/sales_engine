class Api::V1::Transactions::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    count = Transaction.count
    respond_with Transaction.find(Random.new.rand(1..count))
  end
end
