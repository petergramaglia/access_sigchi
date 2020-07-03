Rails.application.routes.draw do
  root to: 'pages#home'
  get '/process_pdf', to: 'pdf_processor#new'
  post "/upload_pdf", to: 'pdf_processor#upload_pdf'
  get '/tool', to: 'pages#tool'
  get '/about', to: 'pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
