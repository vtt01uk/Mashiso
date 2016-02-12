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
	end
	
	def edit
	end
	
	def show
		#use gemfile
		#binding.pry
		#search by id
		@recipe = Recipe.find(params[:id])
	end
	
end