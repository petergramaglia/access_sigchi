Rails.application.routes.draw do
  root to: 'pages#home'
  get "/peter", to: 'pages#peter'
  get "/gramaglia/peter", to: 'users#peter'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

