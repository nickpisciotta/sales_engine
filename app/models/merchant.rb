class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices


  def find_revenue
     revenue = invoices.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).sum("quantity * unit_price")
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
    .select("customer.*, COUNT(invoices.merchant_id) AS results")
    .group(:id)
    .order("results DESC")
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
end
