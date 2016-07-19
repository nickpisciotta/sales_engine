class Api::V1::Items::RandomController < ApplicationController
  respond_to :json, :xml

  def show
    random = rand(Item.count)
    respond_with Item.offset(random).first
  end
end
