class Api:::Admin:ServiceController < AdminController
	# t.string :name
	# t.text :descriptor
	# t.references :services, index: true
	def show
			response_for (@service = Service.find(params[:service_id]))
	end

	def create
		response_for (@service = Service.create(service_params))
	end

	def update
		response_for (@service = Service.where(params[:service_id]).update_all(service_params))
	end

	def destroy
		@service = Service.find(params[:service_id])
		@service.destroy
		response_for 'Service'
	end
	private
		def service_params
			{
				name: params[:name],
				descriptor: params[:descriptor],
				services: params[:services]
			}
		end
end