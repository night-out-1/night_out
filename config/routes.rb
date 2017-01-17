Rails.application.routes.draw do


	resources :comments

  devise_for :users


	resources :events	



  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
