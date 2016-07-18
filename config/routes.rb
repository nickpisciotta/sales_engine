Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show], defaults: {format: :json} 
      namespace :items do
        resources :find, only: [:show]
        resources :find_all, only: [:index]
      end
    end
  end




end
