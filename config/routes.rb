Rails.application.routes.draw do
  devise_for :users
  root "meetups#index"
  resources :meetups do
    resources :memberships
  end

  namespace :api do
    resources :meetups do
      resources :memberships
    end
  end
end
