Rails.application.routes.draw do
 
  get 'rooms/show'

  #get 'home/top'
  root 'home#top'
  post '/rooms/create' #, to: 'rooms#create'
  resources :users
  namespace :auth do
    post 'add_session'
    delete 'logout'
  end
  get '/login' => 'auth#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plf' => 'users#edit_plf'
end
