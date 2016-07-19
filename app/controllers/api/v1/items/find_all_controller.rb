class Api::V1::Items::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Item.where(strong_params)
  end

  private
    def strong_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
