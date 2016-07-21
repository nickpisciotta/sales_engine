class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json, :xml

  def show
    merchant = Merchant.find(params['id'])
    respond_with merchant.favorite_customer
  end
end
