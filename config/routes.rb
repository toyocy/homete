Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts
  root to: 'static_pages#home'

  get 'about', to: 'static_pages#about'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
end
