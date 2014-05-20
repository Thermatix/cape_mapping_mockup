class User < ActiveRecord::Base

	has_secure_password
	has_many :maps
	validates :name, presence: true, uniqueness: true
	validates :password,
		presence: { on: :Create, message: "No password present."},
		length: {minimum: 8, message: "Password must be a minimum of of 8 characters long"},
		confirmation: true
	validates :password_confirmation, presence: true if !@password.nil?

	 before_create :give_api_access

	def permissions
		@per ||=  begin
			if self.perms.nil?
				{}
			else
				self.perms.split('.').inject({}){|result,element| result[:"{element}"] = true ; result}
			end
		end
	end

	def permissions= input,value=true
		r = false
		store_perms= false
		if input.is_a?(Array)
			input.each do |element|
				if !self.permissions[element]
					self.permissions[element] = value
					store_permissions = true
				end
			end
		elsif input.is_a?(Hash)
			input.each do |key,value|
				self.permissions[key] = value
				store_permissions = true
			end
		elsif input.is_a?(String)
			if !self.permissions.include?(input)
				self.permissions[input] = value
				store_perms = true
			end
		else
			raise ArgumentError,'Input can only be type of, Array, Hash or string'
		end

		if store_perms
			store_permissions(self.permissions)
			r = true
		end
		return r
	end

	def admin?
		self.permissions['admin']
	end

	def set_admin
		self.permissions = 'admin'
	end

	private
		def store_permissions to_Save
			string_of_keys = ''
			e = to_Save.length
			to_Save.each do |key,value|
				if value == true
					string_of_keys += key
					string_of_keys += '.'if e > 1
				end
			end
			string_of_keys[-1] = '' if e > 1
			self.perms = string_of_keys
		end

		def give_api_access
			self.permissions = 'api'
		end
end
