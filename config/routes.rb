Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection { get :authenticate }
  end
end
