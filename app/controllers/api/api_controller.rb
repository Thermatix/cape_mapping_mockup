class Api::ApiController < ApplicationController

	set_permissions :api
	before_action :check_permissions, except: :set_permissions
	respond_to :json

	def show object
		response_for object
	end

	def create object
		response_for object
	end

	def update object
		response_for object
	end

	def destroy object, type
		object.destroy
		response_for type
	end

	def response_for object
		respond_with object do |format|
			if action_name == 'destroy'
				format.json {render json: {code: 200, message: "{object} destroyed" }}
			elsif action_name == 'show'
				format.json {render json: object}
			elsif object.save
				format.json {render json: object}
			else
				format.json {render json: {code: 404, message: object.errors}}
			end
		end
	end

end