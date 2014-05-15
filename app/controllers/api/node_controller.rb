class Api::NodeController < ApiController
	# t.references :service
	# t.integer :type
	# t.integer :evo_value
	# t.integer :value_chain

	def show
		@node = Node.find(params[:node_id])
		respond_with @node do |format|
			format.json{render json: @node}
		end
	end

	def create
		@node = Node.create(node_params)
		save @node
	end

	def update
		@node = Node.where(params[:node_id]).update_all(node_params)
		save @node
	end

	def destroy
		@node = Node.find(params[:node_id])
		@node.destroy
		respond_with @node do |format|
			format.json{render json: @node}
		end
	end
	private
		def node_params
			{service: params[:service], type: params[:type], evo_value: params[:evo_value], params[:value_chain]}
		end
end