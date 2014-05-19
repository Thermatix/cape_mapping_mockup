class Api::MapController < ApiController
	# t.string :name
	# t.references :node, index: true
	# t.references :link, index: true
	# t.references :user
	def show
		super(@map = Map.find(params[:map_id])
	end

	def create
		super(@map = Map.create(map_params))
	end

	def update
		super(@map = Map.where(params[:map_id]).update_all(map_params))
	end

	def destroy
		super((@map = Map.find(params[:map_id]),'Map')
	end

	private
		def map_params
			@map_params ||={
				name: params[:name],
				nodes: params[:nodes],
				links: params[:links],
				user: params[:user_id]
			}
		end
end