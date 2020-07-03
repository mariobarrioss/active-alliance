Rails.application.routes.draw do
  get 'static_pages/about', to: 'static_pages#about', as: :about
  root 'static_pages#home'
end
