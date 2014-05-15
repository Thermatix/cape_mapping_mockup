class Api::MapController < ApiController

	def show
		@map = Map.find(params[:map_id])
		respond_with @map do |format|
			format.json{render json: @map}
		end
	end

	def create

	end

	def update

	end

	def destroy

	end
	private
end