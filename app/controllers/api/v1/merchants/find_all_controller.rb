class Api::V1::Merchants::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.where(merchant_all_params)
  end

  private
    def merchant_all_params
      params.permit(:id, :name, :created_at, :updated_at)
    end
end
