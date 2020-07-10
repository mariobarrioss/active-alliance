Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/about', to: 'static_pages#about', as: :about
  get 'profile', to: 'users#show'
  get 'personal', to: 'users#personal'
  get 'external', to: 'users#external'
  root 'users#show'

  resources :activities do
    resources :likes, only: [:create, :destroy]
  end

  resources :groups
end
