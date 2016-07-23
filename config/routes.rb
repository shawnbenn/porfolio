Rails.application.routes.draw do
	  devise_for :users
	  devise_scope :user do  
	   get '/users/sign_out' => 'devise/sessions#destroy'
	   get '/shawn/sign_up', to: "devise/registrations#new"     
	  end
resources :posts
resources :projects
resources :contacts, only: [:new, :create]
get 'welcome/index'
root 'welcome#index'

get '*path' => redirect('/')
end
