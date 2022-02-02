Rails.application.routes.draw do
  
  devise_for :users
  root 'rooms#index'
  resources :rooms do
    resources :messages
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
