class Api::V1::Invoices::FindController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Invoice.find_by(item_params)
  end

  private
    def item_params
      params.permit(:id, :status, :created_at, :updated_at)
    end

end
