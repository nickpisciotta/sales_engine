class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def index
    if params['date']
      revenue = Merchant.find(params['id']).revenue_by_date(params['date'])
      respond_with formatted(revenue)
    else
      @revenue = formatted(Merchant.find(params['id']).find_revenue)
      respond_with @revenue, serializer: MerchantRevenueSerializer
    end
  end
end
