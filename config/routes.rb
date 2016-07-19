Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do

      namespace :merchants do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end

      resources :merchants, only: [:index, :show] do
        get '/random' "merchants#random"
      end

      resources :customers, only: [:index, :show] do
        get '/random' "customers#random"
      end

      resources :items, only: [:index, :show] do
        get '/random' "items#random"
      end

      merchants/find #=> merchanges#find
      merchants/find_all #=> merchanges#find_all
      merchants/random #=> merchanges#random

      # merchants #=> index
      merchants?name=Mike
      [{}, {}]
      merchants/find?name=Mike
      {}

      merchants?random=true&name=Mike
      [{}]

      merchants/random

      if params[:random]
        return Merchant.random()
      else
        if params[:name]
          ...
        end
        return ar_relation
      end

      # merchants = Merchant
      # if params[:name]
      #   merchants = merchants.where(name: params[:name])
      # end
      # if params[:age]
      #   merchants = merchants.where(age: params[:age])
      # end
      # Merchant.where(name: 'Mike').or.where(age: 3939).all


      namespace :customers do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end
      resources :transactions, only: [:index, :show]

      namespace :items do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
      end
      resources :items, only: [:index, :show], defaults: {format: :json}

      namespace :invoices do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
      end
      resources :invoices, only: [:index, :show], defaults: {format: :json}

      namespace :invoice_items do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
      end
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}

    end
  end
end
