class User < ActiveRecord::Base
	# t.string :name
	# t.string :company
	# t.string :password
	# t.references :map
	has_many :maps
	validates :name, presence :true
	validates :password, presence :true, confirmation: true
	validates :password_confirmation, presence :true, on: [:create]
	validates :password_confirmation, presence :true, if(self.password_changed?)
end
