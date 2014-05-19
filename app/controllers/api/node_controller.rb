class Api::NodeController < ApiController
	# t.references :service
	# t.integer :type
	# t.integer :evo_value
	# t.integer :value_chain

	def show
		response_for (@node = Node.find(params[:node_id]))
	end

	def create
		response_for (@node = Node.create(node_params))
	end

	def update
		response_for (@node = Node.where(params[:node_id]).update_all(node_params))
	end

	def destroy
		@node = Node.find(params[:node_id])
		@node.destroy
		response_for 'Node'
	end
	private
		def node_params
			{
				service: params[:service],
				type: params[:type],
				evo_value: params[:evo_value],
				value_chain: params[:value_chain]
			}
		end
end