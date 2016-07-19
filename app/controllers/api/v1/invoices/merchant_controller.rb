class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with(Invoice.find(params[:id]).merchant)
  end
end
