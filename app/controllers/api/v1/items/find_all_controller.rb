class Api::V1::Items::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.where(item_params)
  end

  private
    def item_params
      params.permit(:id, :name, :created_at, :updated_at, :merchant_id)
    end
end
