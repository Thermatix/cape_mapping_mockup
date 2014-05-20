class Api:::Admin:ServiceController < AdminController
	# t.string :name
	# t.text :descriptor
	# t.references :services, index: true
	def show
		super(@service = Service.find(params[:service_id]))
	end

	def create
		super(@service = Service.create(service_params))
	end

	def update
		super(@service = Service.where(params[:service_id]).update_all(service_params))
	end

	def destroy
		super((@service = Service.find(params[:service_id]),'Service')
	end
	private
		def service_params
			@service_params ||={
				name: params[:name],
				descriptor: params[:descriptor],
				services: params[:services]
			}
		end
end