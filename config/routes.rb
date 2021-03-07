Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  get 'sign_in', to: 'users#signin'
  post 'sign_in', to: 'users#signedin'
  delete 'logout', to: 'users#destroy'

  resources :users, only: %i[create show]
  root 'main#home'
end
