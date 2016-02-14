class Recipe < ActiveRecord::Base
	
	#define association
	belongs_to :chef
	has_many :likes
	
	validates :chef_id, presence: true
	#validate name and enforce the presence is true otherwise, returns false
	validates :name, presence: true, length: {minimum: 5, maximum: 25}
	validates :summary, presence: true, length: {minimum: 5, maximum: 50}
	validates :description, presence: true, length: {minimum: 10, maximum: 500}

	mount_uploader :picture, PictureUploader
	validate :picture_size
	
	def thumbs_up_total
		self.likes.where(like: true).size
	end
	
	def thumbs_down_total
		self.likes.where(like: false).size
	end
	
	private
	def picture_size
		#Ensure the image uploaded on the server side is more than 5Mb
		if picture.size > 5.megabytes
			errors.add(:picture, "Should be less than 5Mb")
		end
	end
end