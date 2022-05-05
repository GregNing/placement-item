Rails.application.routes.draw do
  resources :campaigns do
    resources :line_items
  end

  scope '/line_items/:line_item_id', as: 'line_item' do
    resources :comments
    get '/histories', to: 'line_item/histories#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'campaigns#index'
end
