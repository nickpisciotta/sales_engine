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
