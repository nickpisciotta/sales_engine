class Api::V1::Merchants::PendingInvoicesController < ApplicationController
  respond_to :json, :xml
  def index
    customers = Merchant.find(params[:id]).customers_with_pending_invoices
    render json: customers
  end
end
