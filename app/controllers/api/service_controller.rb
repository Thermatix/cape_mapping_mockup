class Api::ServiceController < ApiController
	def show
		@service = Service.find(params[:service_id])
		respond_with @service do |format|
			format.json{render json: @service}
		end
	end
end