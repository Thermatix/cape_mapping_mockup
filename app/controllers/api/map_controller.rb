class Api::MapController < ApiController
	# t.string :name
	# t.references :node, index: true
	# t.references :link, index: true
	# t.references :user
	def show
		response_for (@map = Map.find(params[:map_id]))
	end

	def create
		response_for (@map = Map.create(map_params))
	end

	def update
		response_for (@map = Map.where(params[:map_id]).update_all(map_params))
	end

	def destroy
		@map = Map.find(params[:map_id])
		@map.destroy
		response_for 'Map'
	end
	private
		def map_params
			{
				name: params[:name],
				nodes: params[:nodes],
				links: params[:links],
				user: params[:user_id]
			}
		end
end