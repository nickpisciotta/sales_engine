class Api::V1::Invoices::FindController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.find_by(strong_params)
  end

  private
    def strong_params
      params.permit(:id, :status, :created_at, :updated_at)
    end

end
