class Tokens < ActiveRecord::Base
	# t.references :user, index: true
	# t.string :auth_code
	# t.string :auth_token
	# t.string :refresh_token
	# t.datetime :auth_life
	# t.datetime :refresh_life
	before_create :gen_auth_code
	private
		def gen_auth_Code
			self.auth_code = gen_code_for 'auth_code'
		end

		def gen_code_for type
			loop do
				if type == 'auth_code'
					random_token = SecureRandom.urlsafe_base64(nil,false)
				elsif type == 'auth_token'
					random_token = SecureRandom.base64(16)
				elsif type == 'refresh_token'
					random_token = SecureRandom.base64(32)
				end
				break unless Tokens.exists?('type': random_token)
			end
			random_token
		end
end