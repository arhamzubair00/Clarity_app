Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :day, only: [:index, :show]
  resources :task
  resources :mood, only: [:index, :new, :edit, :show]
end
