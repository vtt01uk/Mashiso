class RecipesController < ApplicationController
	#index action 
	def index
		#goes to db, graps all recipes & stores in @recipes object
		@recipes = Recipe.all
	end
	
	def new
	end
		
	def edit
	end
	
	def show
	end
	
end