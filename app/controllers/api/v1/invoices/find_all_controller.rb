class Api::V1::Invoices::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.where(strong_params)
  end

  private
    def strong_params
      params.permit(:id, :status, :created_at, :updated_at)
    end
end
