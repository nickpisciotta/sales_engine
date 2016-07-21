class Api::V1::Items::MostItemsController < ApplicationController
  respond_to :json, :xml

  def index
    items_greatest_quantity = Item.items_with_greatest_quantity(params[:quantity])
    respond_with items_greatest_quantity
  end
end
