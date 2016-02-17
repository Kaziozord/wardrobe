Rails.application.routes.draw do

  root 'items#index'
  get 'items', to: 'items#index'
  post 'list_items', to: 'items#list_filtered_items'
  post 'add_item', to: 'items#add_item'
end
