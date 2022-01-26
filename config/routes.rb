Rails.application.routes.draw do
 
  resources :rooms
 
  mount ActionCable.server => '/cable'

  get 'home/top'
  root 'auth#login'

  post '/rooms/create_text' #, to: 'rooms#create'
  resources :users do
    collection do
      get 'add_friend'
      get 'show_plf'
    end
  end
  namespace :auth do
    post 'add_session'
    delete 'logout'
  end
  get '/login' => 'auth#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/plf' => 'users#edit_plf'

  get '/matching' => 'users#matching'
  post '/matching' => 'users#matching'

  get '/details' => 'users#details'

end
