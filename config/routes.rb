Rails.application.routes.draw do
  root  'home#index'
 
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get     '/login',  to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
  resources :relationships, only: [:create, :destroy]
end