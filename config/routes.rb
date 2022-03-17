Rails.application.routes.draw do

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions'
  }
  devise_scope :admin do
    get "sign_in", :to => "admins/sessions#new"
    get "sign_out", :to => "admins/sessions#destroy"
  end

  devise_for :customers

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
