Rails.application.routes.draw do
	root "pages#home"
  devise_for :users

	resources :users, except: :destroy do
		resources :posts, except: :destroy do
			resources :comments, only: [:new, :create]
		end
		resources :pets, execpt: [:edit, :update] do
			get "/mailers/new" => "mailer#new"
		end
	end
	get "/adoptions" => "adoptions#random"
	get "/adopition/zip" => "adoptions#local"


end
