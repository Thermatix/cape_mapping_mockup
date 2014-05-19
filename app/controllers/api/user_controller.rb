class Api::UserController < ApiController
	# t.string :name
	# t.string :company
	# t.string :password
	# t.references :map
	# t.string :p 'for permissions'

	def show
		response_for @user
	end

	def create
		response_for (@user = User.create(user_params))
	end

	def update
		response_for (@user = User.where(params[:user_id]).update_all(user_params))
	end

	def destroy
		@user = User.find(params[:user_id])
		@user.destroy
		response_for 'User'
	end
	private

		def user_params
			{
				name: params[:name],
				company: params[:company],
				password: params[password],
				password_confirmation: params[:password_confirmation],
			}
		end


end