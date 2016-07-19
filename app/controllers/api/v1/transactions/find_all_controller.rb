class Api::V1::Transactions::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Transaction.where(transaction_all_params)
  end

  private
    def transaction_all_params
      params.permit(:id, :credit_card_number, :credit_card_expiration_date, :invoice_id, :result, :created_at, :updated_at)
    end
end
