Rails.application.routes.draw do

  devise_for :admins

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :customers, :controllers => {
    :registrations => 'customers/registrations',
    :sessions => 'customers/sessions'
  }

  devise_scope :customer do
    get "sign_in", :to => "customers/sessions#new"
    get "sign_out", :to => "customers/sessions#destroy"
  end

end
