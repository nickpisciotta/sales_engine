class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with(InvoiceItem.find(params[:id]).invoice)
  end
end
