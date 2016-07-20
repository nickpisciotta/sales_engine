class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  default_scope { order('id ASC') }
end



#########################TO get spec harness to pass probably have to be storing as a string in db
