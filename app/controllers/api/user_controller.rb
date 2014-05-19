class Api::UserController < ApiController
	# t.string :name
	# t.string :company
	# t.string :password
	# t.references :map
	# t.string :p 'for permissions'

	def show
		super(@user)
	end

	def create
		super(@user = User.create(user_params))
	end

	def update
		super(@user = User.where(params[:user_id]).update_all(user_params))
	end

	def destroy
		super((@user = User.find(params[:user_id]),'User')
	end

	private

		def user_params
			@user_params ||= {
				name: params[:name],
				company: params[:company],
				password: params[password],
				password_confirmation: params[:password_confirmation],
			}
		end


end