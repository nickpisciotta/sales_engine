Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :items do
        # resources :find, only: [:show]
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        # resources :find_all, only: [:index]
      end
      resources :items, only: [:index, :show], defaults: {format: :json}
    end
  end




end
