class ChefsController < ApplicationController

	def index
		@chefs = Chef.paginate(page: params[:page], per_page: 3)
	end
	
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
		@chef = Chef.find(params[:id])
	end
	
	#will handle the the edit action
	def update
#		binding.pry
		@chef = Chef.find(params[:id])
		if @chef.update(chef_params)
			flash[:success] = "Your profile has been updated successfully"
			redirect_to recipes_path #show chef's page!
		else
			render 'edit'
		end
	end
	
	
	def show
		@chef = Chef.find(params[:id])
		@recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
	end
	
	private
	def chef_params
		params.require(:chef).permit(:chefname, :email, :password)
	end
end