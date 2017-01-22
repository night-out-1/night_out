class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_array
  
  protected

<<<<<<< HEAD

  	def set_array
  		#below sets @array to an array of id's and lat and long of all events in order to send that to JS. bz
      	@events = Event.all
      	@array = []
      	@events.each do |event|
      		array = [event.id, event.location_latitude.to_f, event.location_longitude.to_f]
      		@array.push(array)
      	end
    end
=======
	def set_array
		#below sets @array to an array of id's and lat and long of all events in order to send that to JS. bz
    	@events = Event.all
    	@array = []
    	@events.each do |event|
    		array = [event.id, event.location_latitude.to_f, event.location_longitude.to_f]
    		@array.push(array)
    	end
  end
>>>>>>> 68e98145c2d922557117fa81f8d8655b2dedc3a4

	def configure_permitted_parameters
	       devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
	       devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end

	# private

	# def sign_up_params
	#   	params.require(:user).permit(:username, :email, :password, :avatar, :postal_code)
	# end

	# def account_update_params
 # 	 	params.require(:user).permit(:username, :email, :password, :avatar, :postal_code)
	# end
end

