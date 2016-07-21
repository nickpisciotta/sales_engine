class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.items_with_greatest_revenue(quantity_params)
    item_revenue_hash = Item.joins(:invoice_items).group("items.id").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").limit(quantity_params).sum("invoice_items.quantity * invoice_items.unit_price")
    item_revenue_hash.keys.map do |item_id|
      Item.find_by(id: item_id)
    end
  end

  def self.items_with_greatest_quantity(quantity_params)
    item_quantity_hash = Item.joins(:invoice_items).group("items.id").order("sum_invoice_items_quantity DESC").limit(quantity_params).sum("invoice_items.quantity")
    item_quantity_hash.keys.map do |item_id|
      Item.find_by(id: item_id)
    end
  end

  def best_day
    best_day_hash = invoices.joins(:invoice_items).group("invoices.created_at").order("sum_invoice_items_quantity_all_invoice_items_unit_price DESC").sum("invoice_items.quantity * invoice_items.unit_price")
    best_day_hash.keys.first
  end
end
