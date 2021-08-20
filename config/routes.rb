Rails.application.routes.draw do
  # resources :tasks
  resources :groups do
    resources :tasks
  end
  devise_for :users 

  resources :users do
    resources :groups
  end

  patch "/groups/:id/add_user", to: "groups#add_user_to_group", as: "add_user_to_group"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
