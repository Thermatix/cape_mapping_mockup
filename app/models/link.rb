class Link < ActiveRecord::Base
	# t.string :node_a
	# t.string :node_b
	# t.integer :direction
	# t.references :map
	include ActiveModel::Validations
	belongs_to :map

	validates :direction, presence :true,  numericality: { :greater_than : 0, :less_than_or_equal_to : 3}
	validates :node_a, presence :true
	validates :node_b, presence :true
	validates_with Validator

	def node_A
		@nodeA ||= Link.find(self.node_a)
	end

	def node_B
		@nodeB ||= Link.find(self.node_b)
	end

end

class Validator < ActiveModel::Validator
	def validate(record)

		unless Node.find(record.node_a)
			record.errors[:node_a_id] << "Need valid ID for node_a"
		end

		unless Node.find(record.node_b)
			record.errors[:node_b_id] << "Need valid ID for node_b"
		end

	end

end