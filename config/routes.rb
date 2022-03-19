Rails.application.routes.draw do

  # namespace :public do
  #   get 'customers/show'
  #   get 'customers/edit'
  # end

  scope module: :public do
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
    resources :genres, only: [:index,:create,:edit,:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

end

