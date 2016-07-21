class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json, :xml

  def show
    customer = Customer.find(params[:id])
    respond_with customer.favorite_merchant
  end
end
