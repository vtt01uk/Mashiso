class RecipesController < ApplicationController
	#index action 
	def index
		#goes to db, graps all recipes & stores in @recipes object
		#show trending recipes according to likes
		@recipes = Recipe.paginate(page: params[:page], per_page: 5)
		
#		@recipes = Recipe.all.sort_by{ |likes| likes.thumbs_up_total }.reverse
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
		#How to find a recipe via its id:
		@recipe = Recipe.find(params[:id])
	end
	
	def update
		@recipe =  Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			flash[:success] = "Your recipe was updated successfully"
			redirect_to recipe_path(@recipe)
		else
			render :edit
		end
	end
	
	def like
#		binding.pry
		@recipe = Recipe.find(params[:id])
		# like is the key, params[:like] is the value: #chef is hard coded for now!
		like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
		if like.valid?
			flash[:success] = "Your selection was successful"
			redirect_to :back #send the user back 
		else
			flash[:danger] = "You can only like/dislike a recipe once"
			redirect_to :back
		end
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
		params.require(:recipe).permit(:name, :summary, :description, :picture)
	end
end