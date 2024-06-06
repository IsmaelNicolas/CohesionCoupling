Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :projects, only: [:index, :create] do
      resources :tasks, only: [:index, :create]
    end

    get 'tasks', to: 'users#tasks'
    post 'tasks', to: 'users#create_task'
  end

  resources :projects, only: [:show, :update, :destroy] do
    resources :tasks, only: [:index, :create]
  end

  resources :tasks do
    member do
      patch 'start'
      patch 'complete'
    end
  end
end
