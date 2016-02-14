class Chef < ActiveRecord::Base
	
	#define association
	has_many :recipes
	has_many :likes
	
	
	#before-save callback; before saving emails, convert them to lowercase
	before_save { self.email = email.downcase }
	
	validates :chefname , presence: true, length: {minimum: 3, maximum: 40}
	# From http://emailregex.com/
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 40},
						uniqueness: { case_sensitive: false },
	format: { with: VALID_EMAIL_REGEX }
	
end