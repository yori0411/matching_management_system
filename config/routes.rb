Rails.application.routes.draw do
 
  get 'rooms/show'

  #get 'home/top'
  get'/', to: 'home#top'
  post '/rooms/create' #, to: 'rooms#create'
  resources :users
  namespace :auth do
    post 'add_session'
    delete 'logout'
  end
  get '/login' => 'auth#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
