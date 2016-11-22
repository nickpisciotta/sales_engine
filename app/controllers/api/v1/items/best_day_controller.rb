class Api::V1::Items::BestDayController < ApplicationController
  respond_to :json, :xml

  def show
    item = Item.find(params[:id])
    respond_with item, serializer: BestDaySerializer #or ::BestDaySerializer, not nested
  end
end
