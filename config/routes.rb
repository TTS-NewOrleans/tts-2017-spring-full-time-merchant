Rails.application.routes.draw do

  get '/shop' => 'storefront#index'

  get '/about' => 'storefront#about'

  devise_for :users
  namespace :admin do
    resources :products
    resources :brands
    resources :categories
  end

  resource :cart, only: [:edit, :update, :destroy]
  resources :line_items, only: [:create]

  root 'storefront#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
