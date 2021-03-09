Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'

  get 'sign_in', to: 'users#signin'
  post 'sign_in', to: 'users#signedin'

  delete 'logout', to: 'users#destroy'

  get '/projects/no-group', to: 'projects#no_group'

  resources :users, only: %i[create show edit update]

  resources :projects, only: %i[index show new create]

  resources :groups, only: %i[index show new create]

  root 'main#home'
end
