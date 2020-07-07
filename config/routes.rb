Rails.application.routes.draw do
  root to: 'pdf_processor#new'
  get '/about', to: 'pages#about'
  get '/tool', to: 'pages#tool'

  post '/upload_pdf', to: 'pdf_processor#upload_pdf'
  post '/tool', to: 'pdf_processor#create'

  post '/pdf_processor' => 'pdf_processor#create'

  # resources :pdf_processor
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
