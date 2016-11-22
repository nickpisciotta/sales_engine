class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json, :xml
  
  def formatted(revenue)
    value = (BigDecimal(revenue)/100).to_s
  end

  def format_unit_price(unit_price)
    (BigDecimal(unit_price) * 100).to_i
  end
end
