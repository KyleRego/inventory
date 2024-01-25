Rails.application.routes.draw do
  resources :items
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "locations#index"
end
