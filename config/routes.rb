Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  root to: "sciences#index"

  namespace :v1, defaults: { format: "json" } do
    devise_scope :user do
      post "users/sign_in", to: 'sessions#create'
    end

    resources :sciences do
      resources :tests
    end

    resources :tests do
      resources :questions
    end
  end

  resources :sciences do
    resources :tests
  end

  resources :tests do
    resources :questions
  end

  resources :questions do
    resources :answers
  end
end
