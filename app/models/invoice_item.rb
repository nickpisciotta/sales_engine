class InvoiceItem < ApplicationRecord
  before_create :format_unit_price
  belongs_to :item
  belongs_to :invoice
  default_scope { order('id ASC') }
end
