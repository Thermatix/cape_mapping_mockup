require 'awesome_print'
class ApplicationController < ActionController::Base

	# class << self
    cattr_accessor :perms
  # end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method  :set_permissions,:check_permissions, :logged_in?
  before_action  :logged_in?

  def self.set_permissions *permissions
    self.perms = permissions
  end


  def check_permissions
    if !self.perms.include?(:none)
      if @user
      	@user.permissions.each do |p|
      		self.perms.each do |pe|
      			allowed =+ 1 if p == pe
      		end
      	end
        allowed = false if allowed != self.perms.length
      	if !allowed

      		respond_to do |format|
      			format.json{render json: {code: 403, message: 'You are not authorized for this API endpoint'}}
      			format.html{render file: 'public/403.html', status: :unauthorized, layout: false }
    	  	end

      	end
      else

        respond_to  do |format|
          format.json{render json: {code: 401, message: 'You are not authenticated.'}}
        end

      end
    end
  end

  def logged_in?
    if request.headers[:access_token]
      search_for = "access_token =" + request.headers[:access_token]
      @token = Token.where(search_for)
    	@user = @token.user
    end
  end


end
