class User < ActiveRecord::Base
	#create association
	has_many :articles
end