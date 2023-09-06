Rails.application.routes.draw do
  # get 'itunes/index'
  post 'itunes/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'itunes#index'
end
