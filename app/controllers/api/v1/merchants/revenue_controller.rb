class Api::V1::Merchants::RevenueController < ApplicationController




#total revenue for a merchant
Merchant.first.invoices.joins(:transactions, :invoice_items).where("transactions.result = 'success'").sum("invoice_items.quantity * invoice_items.unit_price")
end


#Total revenue for an item
Item.first.invoice_items.sum("invoice_items.quantity * invoice_items.unit_price")


 Item.joins(:invoice_items).group("items.id").sum("invoice_items.quantity * invoice_items.unit_price")
