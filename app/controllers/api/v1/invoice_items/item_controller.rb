class Api::V1::InvoiceItems::ItemController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with(InvoiceItem.find(params[:id]).item)
  end
end
