Rails.application.routes.draw do
  get 'user/index'

  resources :users

  root 'users#index'

  post 'users/import'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
