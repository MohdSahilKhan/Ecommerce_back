Rails.application.routes.draw do
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    post 'signup', to: 'registrations#create'
    post 'forgot_password', to: 'passwords#create'
    put 'reset_password', to: 'passwords#update'
  end

end
