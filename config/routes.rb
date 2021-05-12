Rails.application.routes.draw do
  root to: 'pdf_processor#new' # Home page: pdf_processor#new
  get '/about', to: 'pages#about'
  
  post '/update_pdf', to: 'pdf_processor#update_pdf'
  post '/pdf_processor' => 'pdf_processor#create'

  # resources :pdf_processor
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "/erena", to: 'pages#erena'
end
