Rails.application.routes.draw do

  root to: "public/homes#top"
  get "about" => "public/homes#about"

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :genres, only: [:index,:create,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

    #3/19崎田　配送先のリソースを作成
    scope module: :public do
      resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    end

end