Rails.application.routes.draw do

  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  root to: "public/homes#top"


  scope module: :public do
    get "/orders/new" => "orders#new"
    get "/orders/complete" => "orders#complete"
    get "/orders" => "orders#index"
    get "/orders/:id" => "orders#show"
  end

  scope module: :public do
    get "/cart_items" => "cart_items#index"
  end

  scope module: :public do
    get "/customers/mypage" => "customers#show"
    get "/customers/infomation/edit" => "customers#edit"
    patch "/customers/information" => "customers#update"
    get "/customers/check" => "customers#check"
    patch "/customers/withdraw" => "customers#withdraw"
  end

  scope module: :public do
    get 'items/index'
    get "/items" => "items#index"
    get 'items/show'
    get "/items/:id" => "items#show"
  end




  scope module: :admin do
    get "/admin/orders/:id" => "orders#show"
  end

  scope module: :admin do
    get "/admin/customers" => "customers#index"
    get "/admin/customers/show/:id" => "customers#show"
    get "/admin/customers/id/edit" => "customers#edit"
  end

  scope module: :admin do
    get "/admin/items" => "items#index"
    get "/admin/items/new" => "items#new"
    get "/admin/items/:id" => "items#show"
    get "/admin/items/:id/edit" => "items#edit"
  end

  scope module: :admin do
    get "/admin" => "homes#top"
  end



end
