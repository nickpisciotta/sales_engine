class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    count = Customer.count
    respond_with Customer.find(Random.new.rand(1..count))
  end
end
