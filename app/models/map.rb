class Map < ActiveRecord::Base
	# t.string :name
	# t.references :node, index: true
	# t.references :link, index: true
	# t.references :user
  has_many :nodes
  has_many :links
end
