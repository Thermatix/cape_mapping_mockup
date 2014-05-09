class User < ActiveRecord::Base
	# t.string :name
	# t.string :company
	# t.string :password
	# t.references :map
	
	
	has_many :maps
end
