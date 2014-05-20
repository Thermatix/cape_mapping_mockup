class Api::TokenController < Api::ApiController

	set_permissions :none
	respond_to :json, :html

	def index # login with session controller and then go's to show

	end

	def show #ask for authorization returns auth_code

	end

	def new
		@token = Token.create
		respond_with(@token) do |format|
			if @token.save
				if session[:site_login]
					format.json {render json: {code: 200, auth_code: @token.auth_code}}
				else
					# format.html {redirect_to callback_path({auth_code: @token.auth_code}) }
				end
			else
				if session[:site_login]
					format.json {render json: {code: 500, message: 'Somthing went wrong, token was not saved'}}
				else
					format.html{render file: 'public/500.html', layout: false }
				end
			end
		end
	end


	def create #recive auth_code and return auth_token
		@token = Token.find_by_auth_Code(params[:auth_code])
		response_for @token
	end

	def update #get new auth_token with refresh token
		@token = Token.find_by_refresh_token(params[:refresh_token])
		response_for @token
	end

	def destroy #destroy access token
		@token = Token.find_by_refresh_token(params[:refresh_token]) || Token.find_by_access_token(params[:access_token])
		@token.destroy
		response_for 'Token'
	end

	private

		def response_for token
			if token.is_a? String
				super token
			else
				respond_with token do |format|
					if token
						token.gen_token
						format.json {render json: token}
					else
						format.json {render json: {code: 404, message: 'Token not found'}}
					end
				end
			end
		end

end
