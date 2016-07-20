class Api::V1::Customers::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(Customer.count)
    respond_with Customer.offset(random).first
  end
end
