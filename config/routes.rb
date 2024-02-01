Rails.application.routes.draw do
  resources :items
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "locations#index"
  get "/locations/:id/new_item", to: "locations#new_item", as: "location_new_item"
  get "/locations/:id/new_inventory", to: "locations#new_inventory", as: "location_new_inventory"
  post "/locations/:id/items", to: "items#create", as: "location_items"
end
