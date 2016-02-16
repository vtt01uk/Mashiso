class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
	#make the methods available for views
	helper_method :current_user, :logged_in?
	
	#associate the user to appropriate actions
	def current_user
		#memorization; stores the value of what is returned into @current_user which will be used later on by the app
		@current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
	end
	
	def logged_in?
		#Use boolean here; is the user logged in or not?
		!!current_user
	end
	
end
