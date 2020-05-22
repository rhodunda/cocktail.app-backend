Rails.application.routes.draw do
  resources :cocktail_ingredients
  resources :reviews
  resources :favorites
  resources :ingredients
  resources :cocktails
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update]
    end
  end
end
