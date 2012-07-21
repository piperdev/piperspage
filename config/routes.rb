Piperspage::Application.routes.draw do

  resource :articles, only: [:index]

  root :to => "articles#index"
end
