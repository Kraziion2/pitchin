Rails.application.routes.draw do
  get 'agreement/new'
  resources :articles do 
  	member do 
  		get 'agreement'
      get 'cancel_agreement'
  	  get 'reject_agreement' 
      get 'invitation_user'
    end	
  end	
  resources :profiles
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'profiles#new'
  get 'homes/index' 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
