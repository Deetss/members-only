Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  
  root 'static_pages#home'
  
  get '/signup', to: 'users#new'

  post '/signup', to:'users#create'

  get '/edit', to: 'users#edit'

  post '/edit', to: 'users#update'

  get '/login', to:'sessions#new'

  post '/login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
