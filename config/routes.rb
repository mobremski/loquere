Rails.application.routes.draw do
  devise_for :users
  root 'meetups#index'
  resources :meetups do
    resources :memberships
  end
end
