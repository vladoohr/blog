Rails.application.routes.draw do
  # Root 
  root 'welcome#index'

  resources :posts
  resources :users

end
