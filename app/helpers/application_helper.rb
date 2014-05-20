module ApplicationHelper

	def flash_type
		if(!@flash_type)
			if(flash.notice)
				@flash_type = 'notice'
			elsif(flash.alert)
				@flash_type = 'alert'
			end
		end
		return @flash_class
	end

end
