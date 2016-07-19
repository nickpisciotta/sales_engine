class Api::V1::Customers::FindAllController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Customer.where(customer_all_params)
  end

  private
    def customer_all_params
      params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
    end
end
