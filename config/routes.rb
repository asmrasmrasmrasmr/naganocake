Rails.application.routes.draw do

  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end

  scope module: :public do
    resources :items, only: [:index, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete "destroy_all"
      end
    end
    resources :orders, only: [:index, :show, :new, :create] do
      collection do
        #POST＝情報を流す
        post "confirm"
        get "complete"
      end
    end
    resource :customers, only:[:show, :edit, :update] do
     collection do
       get "quit"
       patch "out"
       end
     end
   end


  # namespace :public do

    # resource :customers, only:[:show, :edit, :update] do
    # collection do
    #   get "quit"
    #   patch "out"
    #   end
    # end


    #get '/customers' => 'customers#show'
    #get 'customers/:id', to: 'customer#show', as: 'customers'

    #get 'customers/my_page' => 'customer#show'
    # get 'customer/edit'
    # resources :customer, only: [:edit,:show]


  root to: "public/homes#top"
  get "about" => "public/homes#about"

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/" => "homes#top"
    resources :genres, only: [:index,:create,:edit,:update]
    resources :items, only: [:index, :show, :edit, :new, :create, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 退会確認画面
  get "/customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  # 論理削除用のルーティング
  patch "/customers/withdrawal" => "public/customers#withdrawal", as: "withdrawal"
end

