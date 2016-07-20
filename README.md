# README

The Original Spec For This Module 3 Paired Project can be found here:

https://github.com/turingschool/lesson_plans/blob/master/ruby_03-professional_rails_applications/rails_engine.md

To clone and set up the Sales Engine API:
```
git clone https://github.com/nickpisciotta/sales_engine.git
bundle
rails db:create db:migrate
rake import_all
```
#### Available Record Endpoints:

The API has record endpoints for Merchant, Customer, Transaction, Invoice, Item, Invoice Item.

For each of these records you can see all:  
  ``` GET "/api/v1/records" ```

See one individual record by id:   
  ``` GET "/api/v1/records/1" ```

Find a record using any attribute defined on the record:  
  ``` GET "/api/v1/records/find", params: {attribute_name: attribute} ```

Find all records with the same attribute:   
  ``` GET "/api/v1/records/find_all", params: {shared_attribute: attribute} ```

Find a random record:   
  ``` GET "/api/v1/records/random" ```

#### Available Relationship Endpoints:

###### Merchants

``` GET /api/v1/merchants/:id/items ```
* returns a collection of items associated with that merchant

``` GET /api/v1/merchants/:id/invoices ```
* returns a collection of invoices associated with that merchant from their known orders


###### Invoices

``` GET /api/v1/invoices/:id/transactions ```
* returns a collection of associated transactions

``` GET /api/v1/invoices/:id/invoice_items ```
* returns a collection of associated invoice items

``` GET /api/v1/invoices/:id/items ```
* returns a collection of associated items

``` GET /api/v1/invoices/:id/customer ```
* returns the associated customer

``` GET /api/v1/invoices/:id/merchant ```
* returns the associated merchant

###### Invoice Items

``` GET /api/v1/invoice_items/:id/invoice ```
* returns the associated invoice

``` GET /api/v1/invoice_items/:id/item ```
* returns the associated item

###### Items

``` GET /api/v1/items/:id/invoice_items ```
* returns a collection of associated invoice items

``` GET /api/v1/items/:id/merchant ```
* returns the associated merchant


###### Transactions

``` GET /api/v1/transactions/:id/invoice ```
* returns the associated invoice

###### Customers

``` GET /api/v1/customers/:id/invoices ```
* returns a collection of associated invoices

``` GET /api/v1/customers/:id/transactions ```
* returns a collection of associated transactions

#### Business Intelligence
###### All Merchants

``` GET /api/v1/merchants/most_revenue?quantity=x ```
* returns the top x merchants ranked by total revenue

``` GET /api/v1/merchants/most_items?quantity=x ```
* returns the top x merchants ranked by total number of items sold

``` GET /api/v1/merchants/revenue?date=x ```
* returns the total revenue for date x across all merchants

###### Single Merchant

``` GET /api/v1/merchants/:id/revenue ```
* returns the total revenue for that merchant across all transactions

``` GET /api/v1/merchants/:id/revenue?date=x ```
* returns the total revenue for that merchant for a specific invoice date x

``` GET /api/v1/merchants/:id/favorite_customer ```
* returns the customer who has conducted the most total number of successful transactions.

``` GET /api/v1/merchants/:id/customers_with_pending_invoices ```
* returns a collection of customers which have pending (unpaid) invoices

###### Items

``` GET /api/v1/items/most_revenue?quantity=x ```
* returns the top x items ranked by total revenue generated

``` GET /api/v1/items/most_items?quantity=x ```
* returns the top x item instances ranked by total number sold

``` GET /api/v1/items/:id/best_day ```
* returns the date with the most sales for the given item using the invoice date. If there are multiple days with equal number of sales, it will return the most recent day.

###### Customers

``` GET /api/v1/customers/:id/favorite_merchant ```
* returns a merchant where the customer has conducted the most successful transactions

#### Testing/Spec Harness
All tests written in RSpec.
Passing spec harness required for project that can be found here:
https://github.com/turingschool/rales_engine_spec_harness
