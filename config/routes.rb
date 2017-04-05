Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
	post 'home', to: 'users#home'
	post 'myprofile' , to: 'users#show'
	post 'edit_profile', to: 'users#update'
	resources :users
	resources :sessions
	resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
