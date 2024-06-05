Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  resources :tasks

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    get 'tasks', to: 'users#tasks'
    post 'tasks', to: 'users#create_task'
  end
end
