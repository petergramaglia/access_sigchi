Rails.application.routes.draw do
  root to: 'pages#home'
  get '/isaac', to: 'pages#isaac'
  get '/new_page', to: 'pages#new_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end