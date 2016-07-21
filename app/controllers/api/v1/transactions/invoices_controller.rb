class Api::V1::Transactions::InvoicesController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Transaction.find(strong_params).invoice
  end

  def strong_params
    params.require(:id)
  end


end
