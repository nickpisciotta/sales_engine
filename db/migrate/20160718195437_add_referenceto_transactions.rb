class AddReferencetoTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :invoice, index: true, foreign_key: true
  end
end
