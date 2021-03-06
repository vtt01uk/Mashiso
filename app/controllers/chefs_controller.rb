class ChefsController < ApplicationController
	before_action :set_chef, only: [:edit, :update, :show]
	#this action will be performed before all other actions!
	before_action :require_same_user, only: [:edit, :update]
	
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
			#start the session for the user
			session[:chef_id] = @chef.id
			redirect_to recipes_path
		else
			render 'new'
		end
	end
	
	def edit

		#enforce chef can edit only their own recipes
	end
	
	#will handle the the edit action
	def update
#		binding.pry

		if @chef.update(chef_params)
			flash[:success] = "Your profile has been updated successfully"
			redirect_to chef_path(@chef)
		else
			render 'edit'
		end
	end
	
	
	def show

		@recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
	end
	
	private
	def chef_params
		params.require(:chef).permit(:chefname, :email, :password)
	end
	
	def set_chef
			@chef = Chef.find(params[:id])
	end
	
	def require_same_user
		if current_user != @chef
			flash[:danger] = "You can only edit your own profile"
			redirect_to root_path
		end
	end
end