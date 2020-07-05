Rails.application.routes.draw do
  get 'static_pages/home', to: 'static_pages#home'
  get 'static_pages/about', to: 'static_pages#about', as: :about
  root 'static_pages#home'
end
