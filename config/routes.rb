Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users , only: :create
  resources :questions do 
  	member do 
  		put :resolve
  		end	
  	resources :answers


  end

  resources :sessions, only: :create
 # put 'questions/:id/resolve', to: 'questions#resolve'
end
