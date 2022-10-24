Rails.application.routes.draw do

  # namespace :admin do
  #   get 'customers/index'
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  # namespace :admin do
  #   get 'genres/index'
  #   get 'genres/edit'
  # end
  # namespace :admin do
  #   get 'items/index'
  #   get 'items/new'
  #   get 'items/show'
  #   get 'items/edit'
  # end
  # namespace :admin do
  #   get 'homes/top'
  # end
  # namespace :admin do
  #   get 'homes/top'
  #   get 'homes/create'
  # end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
  get "/admin" => "homes#top"
  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  # post '/admin/items' => 'items#create'
  resources :genres, only: [:index, :create, :edit, :update, :new]
  resources :orders, only: [:show, :update]
  patch "/admin/order_details/:id" => "order_details#update"
  end

  scope module: :public do
  root to: "homes#top"
  get "/about" => "homes#about"
  resources :items, only: [:index, :show]
  patch "/customers/withdraw" => "customers#withdraw"
  get "/customers/mypage" => "customers#show"
  get "/customers/info" => "customers#edit"
  patch "/customers/update" => "customers#update"
  resource :customers, only: [:update]
  get "/customers/check" => "customers#check"
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  resources :cart_items, only: [:index, :create, :destroy, :update]
  resources :orders, only: [ :new, :index, :create, :show]
  post "/orders/check" => "orders#check"
  post "/orders/complete" => "orders#complete"
  resources :addresses, only: [ :index, :edit, :create, :update, :destroy]

  end




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
