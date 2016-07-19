Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do

      namespace :merchants do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end
      resources :merchants, only: [:index, :show]


    end
  end

  namespace :api do
    namespace :v1 do
      namespace :items do
        # resources :find, only: [:show]
        get '/find', to: "find#show"
        get '/find_all', to: "find_all#index"
        get '/random', to: "random#show"
        # resources :find_all, only: [:index]
      end
      resources :items, only: [:index, :show], defaults: {format: :json}
    end
  end
end
