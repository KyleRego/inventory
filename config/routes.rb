Rails.application.routes.draw do
  root "locations#index"

  resources :items
  resources :locations
  
  get "/locations/:id/new_item", to: "locations#new_item", as: "location_new_item"
  get "/locations/:id/new_inventory", to: "locations#new_inventory", as: "location_new_inventory"
  post "/locations/:id/items", to: "items#create", as: "location_items"

  get "/inventories/:id", to: "items#edit_inventory", as: "edit_inventory"
  patch "/inventories/:id/items", to: "items#inventory_items", as: "inventory_items"
end
