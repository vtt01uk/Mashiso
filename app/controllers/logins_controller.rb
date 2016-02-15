class LoginsController < ApplicationController

	def new
	end
	
	def create
#		binding.pry
		chef = Chef.find_by(email: params[:email])
		#if chef exists, validate
		if chef && chef.authenticate(params[:password])
			#We grab the user object Chef from the email, authenticate the password. If correct, we take chef_id and store it in browser session cookie
			session[:chef_id] = chef.id
			flash[:success] = "You have logged in successfully"
			redirect_to recipes_path 
		else
			flash.now[:danger] = "Your email address or password does not match"
			render "new"
		end
	end
	
	def destroy
	end

end