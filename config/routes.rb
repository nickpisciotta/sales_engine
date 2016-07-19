Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do

      namespace :merchants do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end
      resources :merchants, only: [:index, :show]

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


    end
  end

  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
      end

      namespace :invoices do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
        get '/:id/transactions', to: "transactions#show"
        get '/:id/invoice_items', to: "invoice_items#show"
        get '/:id/items', to: "items#show"
        get '/:id/customer', to: "customer#show"
        get '/:id/merchant', to: "merchant#show"
      end

      namespace :invoice_items do
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
      end

      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :invoices, only: [:index, :show], defaults: {format: :json}
      resources :invoice_items, only: [:index, :show], defaults: {format: :json}
    end
  end
end
