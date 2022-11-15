Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/spells', to: 'spells#index'
  get '/spells/new', to: 'spells#new'
  post '/spells', to: 'spells#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
