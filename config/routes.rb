Piperspage::Application.routes.draw do

  devise_for :users

  resources :articles, only: [:index, :show, :new, :create]

  match "/admin" => "admin#show", :via => :get

  root :to => "articles#index"
end
