Rails.application.routes.draw do
  
  devise_for :users
  
  resources :lists do
  	resources :tasks
  end

  root 'lists#index'
end
