Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do

      namespace :merchants do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end

      namespace :customers do
        get '/find',             to: 'find#show'
        get '/find_all',         to: 'find_all#index'
        get '/random',           to: 'random#show'
        get '/:id/invoices',     to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
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
