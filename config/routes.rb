Rails.application.routes.draw do

  devise_scope :user do
    authenticated do
      root to: 'tasks#index'
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: nil
    end
  end  


  resources :groups do
    resources :tasks
  end

  resources :tasks do
    resources :groups
  end
  
  devise_for :users 

  resources :users do
    resources :groups
  end

  patch "/groups/:id/add_user", to: "groups#add_user_to_group", as: "add_user_to_group"

  patch "/tasks/:id/add_group", to: "tasks#add_group_to_task", as: "add_group_to_task"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
