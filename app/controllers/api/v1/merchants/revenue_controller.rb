class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def show
    merchant = Merchant.find(params['id'])
    revenue = merchant.invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("quantity * unit_price")
    respond_with revenue
  end
end
