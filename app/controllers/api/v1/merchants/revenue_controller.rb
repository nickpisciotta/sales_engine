class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json, :xml

  def index
    if params['date']
      respond_with Merchant.find(params['id']).revenue_by_date(params['date'])
    else
      respond_with Merchant.find(params['id']).find_revenue
    end
  end
end
