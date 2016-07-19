Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do

      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/find',      to: 'find#show'
        get '/find_all',  to: 'find_all#index'
        get '/random',    to: 'random#show'
      end


    end
  end

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
