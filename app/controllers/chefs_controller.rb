class ChefsController < ApplicationController

	def new
		@chef = Chef.new
	end
	
	#will hand the new action
	def create
#		binding.pry
		@chef = Chef.new(chef_params)
		if @chef.save
			flash[:success] = "Your account has been create successfully"
			redirect_to recipes_path
		else
			render 'new'
		end
	end
	
	def edit
	end
	
	#will handle the the edit action
	def update
	end
	
	
	private
	def chef_params
		params.require(:chef).permit(:chefname, :email, :password)
	end
end