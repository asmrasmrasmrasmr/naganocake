Rails.application.routes.draw do

  root to: "public/homes#top"
  get "about" => "public/homes#about"

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

end
