HrmsHomepage::Application.routes.draw do
  devise_for :users
  root "home#index"
  resources :contacts, :products 
  resources :categories, :product_images
end
