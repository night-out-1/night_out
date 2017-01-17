class RegistrationsController < Devise::RegistrationsController

	private

	def sign_up_params
	  	params.require(:user).permit(:username, :email, :password, :avatar)
	end

	def account_update_params
 	 	params.require(:user).permit(:username, :email, :password, :avatar)
	end

end