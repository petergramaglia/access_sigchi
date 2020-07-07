Rails.application.routes.draw do
  root to: 'pages#home'
  get '/process_pdf', to: 'pdf_procsessor#new'
  post "/upload_pdf", to: 'pdf_processor#upload_pdf'
  get '/tool', to: 'pages#tool'
  post '/tool', to: 'pdf_processor#create'
  get '/about', to: 'pages#about'

  post '/pdf_processor' => 'pdf_processor#create'

  resources :pdf_processor
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
