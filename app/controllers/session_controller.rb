class SessionController < ApplicationController
	def create
		@user = @user.find_by_name(session_params[:name])
		if @user.password == session_params[:password]
			if session[:site_login]
				redirect_to api_get_auth_code_path
			else
				redirect_to api_ask_for_authorize_path
			end
		else
			redirect_to api_authorize_path, flash: {alert: 'Password or Username not recognised,please try again'}
		end
	end


	private

		def session_params
			@session_params ||= {
				name: params[:name],
				password: params[password]
			}
		end
end