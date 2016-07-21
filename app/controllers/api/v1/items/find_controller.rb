class Api::V1::Items::FindController < ApplicationController
  respond_to :json, :xml

  def show
    if params['unit_price']
      price = format_unit_price(params['unit_price'])
      binding.pry
      respond_with Item.find_by(unit_price: price)
    else
      respond_with Item.find_by(item_params)
    end
  end

  private
    def item_params
      params.permit(:id, :name, :created_at, :updated_at, :description, :unit_price, :merchant_id)
    end
end
