class Customer < ApplicationRecord
  has_many :invoices
  has_many :transactions, through: :invoices
  default_scope { order('id ASC') }

  def favorite_merchant
    favorite_merchant_hash = transactions.where(result: "success")
                                         .joins(:invoice)
                                         .group("invoices.merchant_id")
                                         .count("invoices.merchant_id")
    merchant_id = favorite_merchant_hash.keys.first
    Merchant.find_by(id: merchant_id)
  end
end
