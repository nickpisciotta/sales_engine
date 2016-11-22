class Transaction < ApplicationRecord
  belongs_to :invoice
  has_many :invoice_items, through: :invoices

  def self.successful
    where(result: "success")
  end
end
