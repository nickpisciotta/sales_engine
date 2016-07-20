class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute :formatted_unit_price, key: :unit_price

  def formatted_unit_price
    (BigDecimal(object.unit_price)/100).to_s
  end
end
