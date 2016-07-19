class Api::V1::Merchants::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Merchant.find(strong_params).invoices
  end

private

  def strong_params
    params.require(:id)
  end
  
end
