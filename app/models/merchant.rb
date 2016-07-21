class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  default_scope { order('id ASC') }
  scope :successfuly_transactions, -> -> { joins(invoices: [:transactions]).where(transactions: { result: "success" })}

  def find_revenue
     revenue = invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
     invoices.where("invoices.created_at = '#{date}'").joins(:transactions, :invoice_items).where("transactions.result = 'success'").sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.with_most_items(num)
  joins(invoices: [:transactions, :invoice_items])
  .where(transactions: {result: "success"}).group(:id)
  .order('sum(invoice_items.quantity) DESC').limit(num)
  end

  def favorite_customer
    c = customers.joins(:transactions).where(transactions: {result: "success"}).group(:id).order('count(invoices.merchant_id)DESC').first
  end

  def self.revenue(date)
    Invoice.joins(:transactions).where(transactions: {result: "success"}).where(created_at: date).joins(:invoice_items).sum('quantity*unit_price')
  end

  def self.most_revenue(quantity)
    joins(:invoice_items).group(:id).order('sum(invoice_items.unit_price * invoice_items.quantity)DESC').limit(quantity)
  end
end
