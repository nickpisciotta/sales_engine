class Api::V1::Items::FindController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Item.find_by(strong_params)
  end

  private
    def strong_params
      params.permit(:id, :name, :created_at, :updated_at)
    end

end
