class SessionsController < ApplicationController

	def create

		@user = User.find_by_name(session_params[:name])
		ap session_params
		ap @user
		if @user.password == session_params[:password]
			respond_to do |format|
				if session[:site_login]
					format.html{redirect_to api_get_auth_code_path}
					format.js
				else
					format.js {@redirect_path = api_ask_for_authorize_path}
					format.html {redirect_to api_ask_for_authorize_path}
				end
			end
		else
			redirect_to api_authorize_path, flash: {alert: 'Password or Username not recognised,please try again'}
		end
	end


	private

		def session_params
			@session_params ||= {
				name: params[:name],
				password: params[:password]
			}
		end
end