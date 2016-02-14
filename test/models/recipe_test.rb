require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
	
	#create a method
	def setup
		@chef = Chef.create(chefname: "Jamie", email: "jamie@oliver.com")
		#create an instance variable throughout all models
		@recipe = @chef.recipes.build(name:"Bulgogi", summary:"One of South Korea's most famous dishes", description: "Seasoned beef in a savory sauce with mixed vegetables makes a delicious choice any day of the week.")
	end
	
	test "recipe should be valid" do
			#From http://guides.rubyonrails.org/testing.html
			assert @recipe.valid?
	end
	
	test "chef_id should be present" do
		@recipe.chef_id = nil
		assert_not @recipe.valid?
	end
	
	test "name should be present" do
		#check if name field is empty
		@recipe.name = " "
		#expect false / check for failing!
		assert_not @recipe.valid?
	end
	
	test "name length should not be too long" do
		@recipe.name = "a" * 26
		assert_not @recipe.valid?
	end
	
	test "name length should not be too short" do
		@recipe.name = "a" * 4
		assert_not @recipe.valid?
	end
	
	test "summary must be present" do
		@recipe.summary = " "
		assert_not @recipe.valid?
	end
	
	test "summary length should not be too long" do
		@recipe.summary = "a" * 51
		assert_not @recipe.valid?
	end
	
	test "summary length should not be too short" do
		@recipe.summary = "a" * 4
		assert_not @recipe.valid?
	end

	test "description should be present" do
		@recipe.description = " "
		assert_not @recipe.valid?
	end

	test "description should not be too long" do
		@recipe.description = "a" * 1001
		assert_not @recipe.valid?
	end

	test "description should not be too short" do
		@recipe.description = "a" * 9
		assert_not @recipe.valid?
	end

	
end