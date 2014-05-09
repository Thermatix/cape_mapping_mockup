class Node < ActiveRecord::Base
	# t.references :service
	# t.integer :type
	# t.integer :evo_value
	# t.integer :value_chain
	has_one :service

	validates :service, presence :true

end
