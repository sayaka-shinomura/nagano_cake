Rails.application.routes.draw do

  scope module: :admin do
    get 'orders/show'
    get "/orders/show/:id" => "orders#show"
  end

  scope module: :admin do
    get 'customers/index'
    get "/admin/customers/index" => "customers#index"
    get 'customers/show'
    get "/admin/customers/show/:id" => "customers#show"
    get 'customers/edit'
    get "/admin/customers/id/edit" => "customers#edit"
  end

  scope module: :admin do
    get 'items/index'
    get "/admin/items" => "items#index"
    get 'items/new'
    get "/admin/items/new" => "items#new"
    get 'items/show'
    get "/admin/items/:id" => "items#show"
    get 'items/edit'
    get "/admin/items/:id/edit" => "items#edit"
  end

  scope module: :admin do
    get 'homes/top'
    get "/admin" => "homes#top"
  end

  scope module: :public do
    get 'orders/new'
    get 'orders/complete'
    get 'orders/index'
    get 'orders/show'
  end

  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/check'
  end
  namespace :public do
    get 'items/index'
    get "/items" => "items#index"
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

  root to: "public/homes#top"


end
