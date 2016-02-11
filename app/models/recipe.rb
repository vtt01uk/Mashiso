class Recipe < ActiveRecord::Base
	#validate name and enforce the presence is true otherwise, returns false
	validates :name, presence: true, length: {minimum: 5, maximum: 15}
	validates :summary, presence: true, length: {minimum: 5, maximum: 15}
	validates :description, presence: true, length: {minimum: 10, maximum: 500}
end