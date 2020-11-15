Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :surveys, only: [:index] do
    resources :answers, only: [:index]
    resources :questions, only: [:show] do
      resources :answers, only: [:create]
    end
  end

  root to: 'surveys#index'

  namespace :api do
    namespace :v1 do
      resources :surveys, only: [:show] do
        resources :answers, only: [:index, :create]
      end
    end
  end
end
