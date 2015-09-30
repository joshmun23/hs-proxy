Rails.application.routes.draw do
  resources :forms
  root 'homes#index'
  devise_for :users
end
