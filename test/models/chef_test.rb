require 'test_helper'

class ChefTest < ActiveSupport::TestCase
	#setup a chef
	def setup
		@chef = Chef.new(chefname:"Vincent", email:"vincent@example.com")
	end
	
	test "chef should be valid" do
		assert @chef.valid?
	end
	
	test "chefname should be present" do
		@chef.chefname = " "
		assert_not @chef.valid?
	end
	
	test "chefname should not be too short" do
		@chef.chefname = "a" * 2
		assert_not @chef.valid?
	end
	
	test "chefname should not be too long" do
		@chef.chefname = "a" * 41
		assert_not @chef.valid?
	end
	
	test "email should be present" do
		@chef.email = " "
		assert_not @chef.valid?
	end
	
	test "email length should be within bounds" do
		@chef.email = "a" * 101
		assert_not @chef.valid?
	end
	
	test "email should be unique" do
		#check if the saved chef object's email is the same using 'dup' method
		duplicate_chef = @chef.dup
		duplicate_chef.email = @chef.email
		@chef.save
		assert_not duplicate_chef.valid?
	end
	
	test "email validation should accept valid addresses" do
		valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]
		#iterate through each elements in the array
		valid_addresses.each do |x|
			#assign them to var x
			@chef.email = x
			assert @chef.valid?, '#{x.inspect} should be valid'
		end
	end
	
	test "email validation should reject invalid addresses" do
		invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
		invalid_addresses.each do |y|
			@chef.email = y
			assert_not @chef.valid?, '#{y.inspect} should be invalid'
	end
end
	
end