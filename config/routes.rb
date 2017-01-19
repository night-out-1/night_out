Rails.application.routes.draw do


  get 'profiles/index'

  get 'profiles/show'

	resources :comments

	devise_for :users, :controllers => { registrations: 'registrations' }


	resources :events	


  resources :profiles

get 'events/search' => 'events#index'

post 'events/search'
post 'events/add_user_to_event' => 'events#add_user_to_event'
post 'events/remove_user_from_event' => 'events#remove_user_from_event'

post 'events/new'
	post 'static_pages/search'

  resources :profiles



  get 'static_pages/search' => 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/about'

  get 'static_pages/contact'

  root 'static_pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
