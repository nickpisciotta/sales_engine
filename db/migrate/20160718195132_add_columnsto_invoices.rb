class AddColumnstoInvoices < ActiveRecord::Migration[5.0]
  def change
    add_reference :invoices, :merchant, index: true, foreign_key: true
    add_reference :invoices, :customer, index: true, foreign_key: true 
  end
end
