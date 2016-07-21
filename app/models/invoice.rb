class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  # default_scope { order('id ASC') }
end
Item.joins(:invoices, :invoice_items).group("invoices.created_at").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").sum("invoice_items.quantity * invoice_items.unit_price")
