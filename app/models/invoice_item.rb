class InvoiceItem < ApplicationRecord
  before_create :format_unit_price
  belongs_to :item
  belongs_to :invoice
  default_scope { order('id ASC') }

  def format_unit_price
    if unit_price.to_i.to_s != unit_price
      self.unit_price = (self.unit_price.to_f * 100).to_i
    end
  end
end
