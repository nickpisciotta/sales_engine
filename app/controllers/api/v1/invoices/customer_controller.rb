class Api::V1::Invoices::CustomerController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with(Invoice.find(params[:id]).customer)
  end
end
