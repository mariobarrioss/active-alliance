Rails.application.routes.draw do
  devise_for :users
  
  get 'profile', to: 'users#show'
  get 'personal', to: 'users#personal'
  get 'external', to: 'users#external'
  root 'users#show'

  resources :activities do
    resources :likes, only: [:create, :destroy]
  end

  resources :groups
  resources :group_activities, only: [:new, :index, :create]
end
