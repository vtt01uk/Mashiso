Rails.application.routes.draw do
	root 'pages#home'
	get '/home', to: 'pages#home'
	
	#get '/recipes', to: 'recipes#index'
	#get '/recipes/new', to: 'recipes#new', as: 'new_recipe'
	#to handle the submission of a new recipe, use a form:
	#post '/recipes', to: 'recipes#create'
	#get '/recipes/:id/edit', to: 'recipes#edit', as: 'edit_recipe'
	
	#how to handle the edit_recipe submission:
	#put '/recipes/:id', to: 'recipes#update', as: 'update_recipe'
	
	#Show individual recipes:
	#get 'recipes/:id', to: 'recipes#show', as: 'recipe'
	
	#Delete recipe:
	#delete '/recipes/:id', to: 'recipes#destroy'
	
	resources :recipes do
		member do
			post 'like'
		end
	end
	
	resources :chefs, except: [:new]
	
	get '/register', to: 'chefs#new'
	
end
