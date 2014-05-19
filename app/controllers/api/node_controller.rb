class Api::NodeController < ApiController
	# t.references :service
	# t.integer :type
	# t.integer :evo_value
	# t.integer :value_chain

	def show
		super(@node = Node.find(params[:node_id])
	end

	def create
		super(@node = Node.create(node_params))
	end

	def update
		super(@node = Node.where(params[:node_id]).update_all(node_params))
	end

	def destroy
		super((@node = Node.find(params[:node_id]),'Node')
	end

	private
		def node_params
			@node_params ||= {
				service: params[:service],
				type: params[:type],
				evo_value: params[:evo_value],
				value_chain: params[:value_chain]
			}
		end
end