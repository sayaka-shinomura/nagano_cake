Rails.application.routes.draw do

  scope module: :admin do
    resources :orders, only: [:show]
  end

  scope module: :admin do
    resources :customers, only: [:index, :show, :edit]
  end

  scope module: :admin do
    resources :items, only: [:index, :new, :show, :edit]
  end

  scope module: :admin do
    get 'homes/top'
  end

  scope module: :public do
    resources :public_orders, only: [:new, :complete, :index, :show]
  end

  scope module: :public do
    resources :cart_items, only: [:index]
  end

  scope module: :public do
    resources :costomers, only: [:show, :edit, :check]
  end

  scope module: :public do
    resources :items, only: [:index, :show]
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












  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
