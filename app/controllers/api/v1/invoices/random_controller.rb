class Api::V1::Invoices::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(Invoice.count)
    respond_with Invoice.offset(random).first
  end
end
