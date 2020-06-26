Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "/erena", to: 'pages#erena'
get "/download_pdf", to: 'pdfinformations#download_pdf'
end
