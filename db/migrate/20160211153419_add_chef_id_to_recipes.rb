class AddChefIdToRecipes < ActiveRecord::Migration
  def change
		#name of the table, name of column added, type
		add_column :recipes, :chef_id, :integer
	end
end
