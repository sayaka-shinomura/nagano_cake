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
  get "/about" => "public/homes#about"


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
    resources :items, only: [:index, :show]
  end


  scope module: :admin do
    get "/admin" => "homes#top"
  end

  scope module: :admin do
    get "/admin/orders/:id" => "orders#show"
  end

  scope module: :admin do
    get "/admin/customers" => "customers#index"
    get "/admin/customers/:id" => "customers#show", as: 'admin_customer_show'
    get "/admin/customers/:id/edit" => "customers#edit", as: 'admin_customer_edit'
    patch "/admin/customers/:id" => "customers#update", as: 'admin_customer'
  end

  scope module: :admin do
    get "/admin/items" => "items#index"
    get "/admin/items/new" => "items#new"
    post "/admin/items" => "items#create", as: 'admin_item_new'
    get "/admin/items/:id" => "items#show", as: 'admin_item_show'
    get "/admin/items/:id/edit" => "items#edit", as: 'admin_item_edit'
    patch "/admin/items/:id" => "items#update", as: 'admin_item'
  end


end
