class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json, :xml

  def show
    respond_with Merchant.most_revenue(params["quantity"])
  end
end
