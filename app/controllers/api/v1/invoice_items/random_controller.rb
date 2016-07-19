class Api::V1::InvoiceItems::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(InvoiceItem.count)
    respond_with InvoiceItem.offset(random).first
  end
end
