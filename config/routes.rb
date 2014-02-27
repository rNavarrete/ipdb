Ipdb::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post '/rate' => 'rater#create', :as => 'rate'
 devise_for :users
  resources :podcasts
  mount Commontator::Engine => '/commontator'
  
  root "pages#home"
  get "about" => "pages#about"
  get "profile" => "pages#profile"
  get "users" => "user#index"
  get "user/:id", :to => "user#show", :as => :user
end
