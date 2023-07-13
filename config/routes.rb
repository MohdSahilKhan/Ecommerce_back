Rails.application.routes.draw do
  namespace :admin do
    root to: "users#index"
    resources :users
    resources :statuses
    resources :tasks
    resources :projects
  end

  get '/displayleaves', to: 'leaves#displayleaves'

  devise_for :users
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :statuses
  resources :leaves

  namespace :api do
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    post 'signup', to: 'registrations#create'
    post 'forgot_password', to: 'passwords#create'
    put 'reset_password', to: 'passwords#update'
  end

end
