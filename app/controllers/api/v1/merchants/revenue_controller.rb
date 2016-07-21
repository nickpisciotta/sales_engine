class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def show
    if params['date']
      revenue = formatted(Merchant.find(params['id']).revenue_by_date(params['date']))
      respond_with(revenue: revenue)
    else
      revenue = formatted(Merchant.find(params['id']).find_revenue)
      respond_with(revenue: revenue)
    end
  end

  def index
    respond_with(total_revenue: formatted(Merchant.revenue(params['date'])))
  end
end
