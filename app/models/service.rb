class Service < ActiveRecord::Base

	# t.string :name
	# t.text :descriptor
	# t.references :service, index: true
	has_many  :similar_services
  has_many  :services, through: similar_services
  has_many  :nodes

  validates :name presence :true
  validates :direction, presence :true, format: {with: /[1-3]{1}/ message: 'only allows "1,2 or 3"'  }}

end
