class ApplicationController < ActionController::Base
	attr_reader :perms
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :check_permissions, :logged_in?

  before_filter :logged_in?

  def check_permissions
  	@user.permissions.each do |p|
  		self.perms.each do |pe|
  			allowed = true if p == pe
  		end
  	end

  	if !allowed
  		respond_with |format| do
  			format.json{render json: {error: 403, message: 'You are Not authorized for this API endpoint'}}
  			format.html{render file: 'public/403.html', status: :unauthorized, layout: false }
	  	end
  	end
  end

  def logged_in?
  	@user = User.find(params[:user_id] || sesssion[:user_id] || request.headers[:user_id])
  end

  def set_permisions *permissions
  	self.perms = permissions
  end
end
