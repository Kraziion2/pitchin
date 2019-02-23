Rails.application.routes.draw do
  resources :categories
  get 'agreement/new'
  resources :articles do 
  	member do 
  		get 'agreement'
      get 'cancel_agreement'
  	  get 'reject_agreement' 
      get 'invitation_user'
      get 'delete_article'
      get 'accept_approval'
      get 'cancel_approval'
    end	 
    collection do 
      get 'send_invitation'
      get 'invitation'
      get 'active_user'
      get 'active_article'
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
