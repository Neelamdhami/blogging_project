Rails.application.routes.draw do
  get 'comments/index'
  root "home#index"
  devise_for :users
  resources :bloggers do   
    resources :likes
    resources :comments
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
