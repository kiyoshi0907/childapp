Rails.application.routes.draw do
  
  root 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    member do
      get :followings
      get :followers
      get :favorites
      get :media
    end
  end
  delete 'destroy_user', to: 'users#destroy'
  
  resources :posts, only: [:new, :show, :create, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  delete 'likes/:id', to: 'likes#destroy'
  
  get 'yonen', to: 'toppages#yonen'
  get 'zido', to: 'toppages#zido'
  get 'question', to: 'toppages#question'
    
  
  
end
