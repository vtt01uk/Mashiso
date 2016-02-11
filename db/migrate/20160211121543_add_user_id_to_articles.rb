class AddUserIdToArticles < ActiveRecord::Migration
  def change
		#specify adding an addition column to articles table, the name of the foreign key, and the type
		add_column :articles, :user_id, :integer
	end
end
