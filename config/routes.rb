Rails.application.routes.draw do
  # Root 
  root 'welcome#index'

  resources :posts

  resources :users

  get '/login' => 'logins#new'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy'

end
