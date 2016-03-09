Rails.application.routes.draw do
  # Root 
  root 'welcome#index'

  resources :posts, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create] do
	  member do
	    get :posts
	  end
	end

  get '/login' => 'logins#new'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy'

end
