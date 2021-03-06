class RegistrationsController < Devise::RegistrationsController


	private

	def sign_up_params
	  	params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar, :postal_code)
	end

	def account_update_params
 	 	params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password, :avatar, :postal_code)
	end

end