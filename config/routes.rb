Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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
