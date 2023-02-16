Rails.application.routes.draw do
  mount Lookbook::Engine, at: '/lookbook' if Rails.env.development?

  get 'support', to: 'pages#support', as: :support
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
