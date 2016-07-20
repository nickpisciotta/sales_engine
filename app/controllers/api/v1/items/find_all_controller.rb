class Api::V1::Items::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    if params['unit_price']
      price = format_unit_price(params['unit_price'])
      respond_with Item.where(unit_price: price)
    else
      respond_with Item.where(item_params)
    end
  end

  private
  def item_params
    params.permit(:id, :name, :created_at, :updated_at, :description, :unit_price, :merchant_id)
  end
end
