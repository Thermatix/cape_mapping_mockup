class Node < ActiveRecord::Base
	# t.references :service
	# t.integer :type
	# t.integer :evo_value
	# t.integer :value_chain
	has_one :service

	validates :service, presence :true
	validates :type, presence :true,  numericality: { :greater_than : 0, :less_than_or_equal_to : 4}
	validates :evo_value, presence :true,numericality: { :greater_than : 0, :less_than_or_equal_to : 1000 }
	validates :value_chain, presence :true,  numericality: { :greater_than : 0, :less_than_or_equal_to : 500}
end
