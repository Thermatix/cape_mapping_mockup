class Api::UserController < ApiController

	def show
		@user = User.find(params[:user_id] || request.headers)
		respond_with @user do |format|
			format.json{render json: @user}
		end
	end

	def create

	end

	def update

	end

	def destroy

	end
	private
end