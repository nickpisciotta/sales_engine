class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    count = Merchant.count
    respond_with Merchant.find(Random.new.rand(1..count))
  end
end
