class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

	def configure_permitted_parameters
	       devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
	       devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end

	private

	def sign_up_params
	  	params.require(:user).permit(:username, :email, :password, :avatar, :postal_code)
	end

	def account_update_params
 	 	params.require(:user).permit(:username, :email, :password, :avatar, :postal_code)
	end
end

