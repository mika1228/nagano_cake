Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  namespace :admin do
    resources :genres, only: [:create, :index, :edit]
    patch 'genres/:id' => 'genres#update', as: 'update_genre'
    resources :items
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end