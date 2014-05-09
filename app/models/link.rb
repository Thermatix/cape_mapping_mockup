class Link < ActiveRecord::Base
	# t.string :node_a
	# t.string :node_b
	# t.integer :direction
	# t.references :map
	include ActiveModel::Validations
	belongs_to :map

	validates :direction, presence :true, format: {with: /[1-3]{1}/ message: 'only allows "1,2 or 3"'  }}
	validates :node_a, presence :true
	validates :node_b, presence :true
	validates_with Validator

	def node_A
		Link.find(self.node_a)
	end

	def node_B
		Link.find(self.node_b)
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