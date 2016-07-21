class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def formatted(revenue)
    value = (BigDecimal(revenue)/100).to_s
  end

  def format_unit_price(unit_price)
    (unit_price.to_f * 100).to_i
  end
end
