Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :cocktail_ingredients
      resources :reviews
      resources :favorites
      resources :ingredients
<<<<<<< HEAD
      resources :cocktails
      post '/login' => 'users#login'

=======
      resources :cocktails, except: [:index]
      post 'cocktails/search-by-char', to: 'cocktails#search_by_char'
      post 'cocktails/search-by-name', to: 'cocktails#search_by_name'
      post 'cocktails/search-by-ingredient', to: 'cocktails#search_by_ingredient'
      post '/login' => 'users#login'
>>>>>>> 19715e221504569a521c3af293ffce768df50d64
    end
  end
end
