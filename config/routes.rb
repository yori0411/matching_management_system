Rails.application.routes.draw do
  resources :users
  namespace :auth do
    post 'add_session'
    delete 'logout'
  end
  get '/' => 'auth#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
