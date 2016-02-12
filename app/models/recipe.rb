class Recipe < ActiveRecord::Base
	
	#define association
	belongs_to :chef
	
	#validate name and enforce the presence is true otherwise, returns false
	validates :name, presence: true, length: {minimum: 5, maximum: 15}
	validates :summary, presence: true, length: {minimum: 5, maximum: 50}
	validates :description, presence: true, length: {minimum: 10, maximum: 500}
	validates :chef_id, presence: true
end