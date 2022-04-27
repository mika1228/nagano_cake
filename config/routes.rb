Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  namespace :admin do
    root to: "homes#top", as: "top"

    resources :genres, only: [:create, :index, :edit]
    patch 'genres/:id' => 'genres#update', as: 'update_genre'

    resources :items
    patch 'items/:id' => 'items#update', as: 'update_item'

    resources :customers, only: [:index, :show, :edit]
    patch 'customers/:id'=> 'customers#update', as: 'update_customer'

  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"

    resources :customers, only: [:show, :edit]
    patch 'customers/:id' => 'customers#update', as: 'update_customer'
    get  'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw'

    resources :items, only: [:index, :show]
    post 'items/:id' => 'items#show'

    resources :cart_items, only: [:index, :create, :destroy]
    patch 'cart_items/:id' => 'cart_items#update', as: 'update_cart_item'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'

    resources :addresses, only: [:index, :create, :edit, :destroy]
    patch 'addresses/:id' => 'addresses#update', as: 'update_address'

    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks'

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end