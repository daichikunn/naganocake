Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  
  root to: "public/homes#top"
  get "public/homes#about"
  resources :public/items, only: [:index, :show]
  resources :public/registrations, only: [:new, :create]
  resources :public/sessions, only: [:new, :create, :destroy]
  resources :public/customers, only: [:show, :edit, :update]
  get "public/customers#check"
  patch "public/customers#withdraw"
  resources :public/cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
  resources :public/orders, only: [ :new, :index, :create, :check, :complete, :show]
 
  
  
  
  resources :admin/sessions, only: [:new, :create, :delete]
  get "admin/homes#top"
  resources :admin/items, only: [:index, :new, :create, :show, :edit, :update]
  resources :admin/genres, only: [:index, :create, :edit, :update]
  resources :admin/customers, only: [:index, :show, :edit, :update]
  resources :admin/orders, only: [:show, :update]  
  patch "admin/order_details#update"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
