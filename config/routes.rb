Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
  root to: "homes#top"
  get "/about" => "homes#about"
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get "/customers/check" => "customers#check"
  patch "/customers/withdraw" => "customers#withdraw"
  resources :cart_items, only: [:index, :create, :destroy, :update]
  delete "/cart_items/destroy_all" => "orders#destroy_all"
  resources :orders, only: [ :new, :index, :create, :show]
  post "/orders/check" => "orders#check"
  post "/orders/complete" => "orders#complete"
  resources :addresses, only: [ :index, :edit, :create, :update, :destroy]

  end


namespace :admin do
  get "/admin" => "homes#top"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  patch "/admin/order_details/:id" => "order_details#update"
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
