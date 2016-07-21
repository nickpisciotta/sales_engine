class Api::V1::Merchants::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(Merchant.count)
    respond_with Merchant.offset(random).first
  end
end
