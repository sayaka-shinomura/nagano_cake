Rails.application.routes.draw do
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  #顧客用  URL /costomers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用  URL /admin/sign_in...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "homes#top"

  resources :public/items, only: [:index, :show]

  resources :public/customers, only: [:show, :edit, :update, :check]

  resources :public/cart_items, only: [:index, :update, :destroy, :destroy_all, :create]

  resources :public/orders, only: [:new, :index, :show, :create, :confirm, :complete]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
