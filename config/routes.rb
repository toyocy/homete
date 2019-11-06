Rails.application.routes.draw do
  get 'users/new'
  root to: 'static_pages#home'

  get 'about', to: 'static_pages#about'
end
