class Service < ActiveRecord::Base

	# t.string :name
	# t.text :descriptor
	# t.references :services, index: true
	has_many  :similar_services
  has_many  :services, through: similar_services
  has_many  :nodes

  validates :name presence :true
  


end
