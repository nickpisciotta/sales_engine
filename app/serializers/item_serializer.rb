class ItemSerializer < ActiveModel::Serializer
  attributes :description, :id, :merchant_id, :name
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    (BigDecimal(object.unit_price)/100).to_s
  end
end
