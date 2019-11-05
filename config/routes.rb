Rails.application.routes.draw do
  devise_for :users
  root :to => "events#index"
  resources :events, only: [:index, :show, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
