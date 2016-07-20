class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  default_scope { order('id ASC') }

  def find_revenue
     invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).where(invoice_items: {created_at: date }).sum("quantity * unit_price")
  end

  def self.with_most_items(quantity)
    select("merchants.*, sum(quantity) AS num_items").joins(invoices: [:transactions, :invoice_items]).where(transactions: { result: "success" }).group("merchants.id").order("num_items DESC").first(quantity)
  end
end
