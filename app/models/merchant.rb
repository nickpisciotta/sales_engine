
class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def find_revenue
    invoices.joins(:transactions, :invoice_items).merge(Transaction.successful).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.where("invoices.created_at = '#{date}'")
    .joins(:transactions, :invoice_items)
    .where("transactions.result = 'success'")
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.with_most_items(num)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .select("merchants.*, SUM(invoice_items.quantity) AS total")
    .group(:id)
    .order('total DESC')
    .limit(num)
  end

  def favorite_customer
    customers.joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order('count(invoices.merchant_id)DESC')
    .first
  end

  def self.revenue(date)
    Invoice.joins(:transactions)
    .where(transactions: {result: "success"})
    .where(created_at: date)
    .joins(:invoice_items)
    .sum('quantity*unit_price')
  end

  def self.most_revenue(quantity)
    joins(invoices: [:transactions, :invoice_items])
    .where(transactions: {result: "success"})
    .group(:id)
    .order("SUM(invoice_items.quantity * invoice_items.unit_price) DESC")
    .group(:id)
    .limit("#{quantity}")
  end

  def customers_with_pending_invoices
    customers.joins(:invoices)
    .joins("INNER JOIN transactions on transactions.invoice_id=invoices.id")
    .where("transactions.result = 'failed'")
    .distinct
  end
end
