class ApplicationController < ActionController::Base
	attr_reader :perms
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :check_permissions, :logged_in?

  before_filter :logged_in?

  def set_permisions *permissions
    self.perms = permissions
  end

  def check_permissions
    if @user
    	@user.permissions.each do |p|
    		self.perms.each do |pe|
    			allowed =+ 1 if p == pe
    		end
    	end
      allowed = false if allowed == self.perms.length
    	if !allowed
    		respond_with |format| do
    			format.json{render json: {code: 403, message: 'You are not authorized for this API endpoint'}}
    			format.html{render file: 'public/403.html', status: :unauthorized, layout: false }
  	  	end
    	end
    else
      respond_with |format| do
        format.json{render json: {code: 401, message: 'You are not authenticated.'}}
      end
    end
  end

  def logged_in?
  	@user = User.find(params[:user_id] || sesssion[:user_id] || request.headers[:user_id])
  end


end
