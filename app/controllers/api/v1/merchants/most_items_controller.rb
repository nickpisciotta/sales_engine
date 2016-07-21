class Api::V1::Merchants::MostItemsController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.with_most_items(params["quantity"]) 
  end
end
