class ApiController < ApplicationController

	set_permissions :api
	before_all :check_permissions
	respond_to :json

	def save object
		if object.save
			returning = object
		else
			returning = {code: 403, message: object.errors}
		end
		respond_with object |format| do
			if returning = object
				format.json { render json: object }
			else
				format.json { render json: returning }
			end
		end
	end

	def response_for object

		respond_with object do |format|
			if action_name == 'destroy'
				format.json {render json: {coe: 200, message: "{object} destroyed" }
			elsif action_name == 'show'
				format.json {render json: object}
			elsif save object
				format.json {render json: object}
			else
				format.json {render json: object.errors}
			end
		end
	end

end