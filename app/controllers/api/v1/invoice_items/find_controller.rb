class Api::V1::InvoiceItems::FindController < ApplicationController
  respond_to :json, :xml

  def show
    if params['unit_price']
      price = format_unit_price(params['unit_price'])
      respond_with InvoiceItem.find_by(unit_price: price)
    else
      respond_with InvoiceItem.find_by(invoice_item_params)
    end
  end

  private
    def invoice_item_params
      params.permit(:id, :quantity, :unit_price,
                    :invoice_id, :item_id,
                    :created_at, :updated_at)
    end

end
