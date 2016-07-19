Rails.application.routes.draw do
  namespace :api, defaults: { format: :json} do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        #other merchants routes here
      end
    end
  end
end
