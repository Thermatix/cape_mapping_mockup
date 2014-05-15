class User < ActiveRecord::Base
	# t.string :name
	# t.string :company
	# t.string :password
	# t.references :map
	# t.string :p 'for permissions'
	has_many :maps
	validates :name, presence :true
	validates :password, presence :true, confirmation: true
	validates :password_confirmation, presence :true, on: [:create]
	validates :password_confirmation, presence :true, if(self.password_changed?)

	 before_create :give_api_access

	def permissions
		@per ||= self.p.split(',').inject({})(|result,element| result[:"{element}"] = true ; result)
	end

	def permissions= input,value
		r = false
		store_permissions? = false
		if input.kind_of?(Array)
			input.each do |element|
				if !permissions[element]
					permissions[element] = value || true
					store_permissions? = true
				end
			end
		elsif input.kind_of(Hash)
			input.each do |key,value|
				permissions[key] = value
				store_permissions? = true
			end
		elsif input.kind_of?(String)
			if !permissions.include?(input)
				permissions[:"{input}"] = value || true
				store_permissions? = true
			end
		else
			raise ArgumentError,'Input can only be type of, Array, Hash or string'
		end

		if store_permissions?
			store_permissions(permissions)
			r = true
		end
		return r
	end

	def admin?
		permissions[:admin]
	end

	def set_admin
		permissions = 'admin'
	end
	private
		def store_permissions to_Save
			value = ''
			to_Save.each |key,value| do
				if value == true
					value += key.to_String
				end
			end
			self.p = value
		end

		def give_api_access
			permissions = 'api'
		end
end
