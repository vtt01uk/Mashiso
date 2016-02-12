class RecipesController < ApplicationController
	#index action 
	def index
		#goes to db, graps all recipes & stores in @recipes object
		@recipes = Recipe.all
	end
	
	def new
		@recipe = Recipe.new
	end
		
	def create
#		binding.pry
		@recipe = Recipe.new(recipe_params)
		#hardcode chef_id until later on
		@recipe.chef = Chef.find(1)
		
		if @recipe.save
			#send notification
			flash[:success] = "Your recipe was created successfully"
			redirect_to recipes_path
		else
			render :new
		end
	end
	
	def edit
	end
	
	def show
		#use gemfile
		#binding.pry
		#search by id
		@recipe = Recipe.find(params[:id])
	end
	
	#whitelist methods exclusive to this class
	private
		
	def recipe_params
		params.require(:recipe).permit(:name, :summary, :description)
	end
end