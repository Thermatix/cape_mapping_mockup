class ApiController < ApplicationController

	set_permissions :api
	before_all :check_permissions
	respond_to :json

	def save object
		if object.save
			returning = object
		else
			returning = {error: 403, message: object.errors}
		end
		respond_with object |format| do
			if returning = object
				format.json { render json: object }
			else
				format.json { render json: returning }
			end
		end
	end

end