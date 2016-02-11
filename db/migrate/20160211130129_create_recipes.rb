class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
			t.string :name
			t.text :summary, :description
    end
  end
end
