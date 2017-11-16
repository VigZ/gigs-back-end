Rails.application.routes.draw do
  get 'ensembles_controller/index'

  get 'instruments_controller/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :instruments, only: [:index]
      resources :ensembles
      resources :fans
      post "/login", to: "authorization#create"
      get "/verify", to: "authorization#verify"
      get "/search", to: "search#search"
    end
  end
end
