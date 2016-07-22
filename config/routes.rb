Rails.application.routes.draw do
  devise_for :users

  resources :landings

  namespace :api do
    resources :meetups do
      resources :memberships
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'meetups#index', as: :authenticated_root
      resources :meetups do
        resources :memberships
      end
    end
    unauthenticated do
      root 'landings#index', as: :unauthenticated_root
    end
  end

end
