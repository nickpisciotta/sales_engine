class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :invoice_items, through: :invoices
  default_scope { order('id ASC') }
end
