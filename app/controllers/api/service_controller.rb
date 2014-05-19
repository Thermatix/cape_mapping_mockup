class Api::ServiceController < ApiController
	# t.string :name
	# t.text :descriptor
	# t.references :services, index: true
	def show
			response_for (@service = Service.find(params[:service_id]))
	end

end