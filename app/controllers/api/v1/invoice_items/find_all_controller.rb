class Api::V1::InvoiceItems::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with InvoiceItem.where(strong_params)
  end

  private
    def strong_params
      params.permit(:id, :quantity, :unit_price,
                    :invoice_id, :item_id,
                    :created_at, :updated_at)
    end
end
