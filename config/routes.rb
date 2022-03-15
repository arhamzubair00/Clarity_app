Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :days, only: [:index, :show] do
    resources :tasks, except: [ :index ]
  end
  resources :moods, only: [:index, :edit, :show, :update]
end
