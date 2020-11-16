Rails.application.routes.draw do
 
  resources :rooms
 

  #get 'home/top'
  root 'home#top'

  post '/rooms/create_text' #, to: 'rooms#create'
  resources :users
  namespace :auth do
    post 'add_session'
    delete 'logout'
  end
  get '/login' => 'auth#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plf' => 'users#edit_plf'

  get '/matching' => 'users#matching'

  get '/details' => 'users#details'

end
