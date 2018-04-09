Rails.application.routes.draw do

  resources :registrations, only: [:new, :create]
  resources :contacts, only: :create

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes self

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
end
