class Api::V1::Items::MostRevenueController < ApplicationController
  respond_to :json, :xml

  def index
    items_most_revenue = Item.items_with_greatest_revenue(params[:quantity])
    respond_with items_most_revenue
  end
end
