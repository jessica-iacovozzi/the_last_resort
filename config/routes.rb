Rails.application.routes.draw do
  get '/bookings/new', to: 'bookings#new'
  post '/bookings', to: 'bookings#create'
  get '/my_bookings', to: 'bookings#my_bookings'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'
  delete '/bookings/:id', to: 'bookings#destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/spells', to: 'spells#index'
  get '/spells/new', to: 'spells#new'
  post '/spells', to: 'spells#create'
  get '/spells/:id', to: 'spells#show', as: 'spell'
  get '/my_spells', to: 'spells#my_spells'
  # Defines the root path route ("/")
  # root "articles#index"
end
