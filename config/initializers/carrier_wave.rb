if Rails.env.production?
	#We now need Amazon's S3 access key, secret key & bucket
	CarrierWave.configure do |config|
		config.fog_credentials = {
		:provider => 'AWS',
		:aws_access_key_id => ENV['S3_ACCESS_KEY'],
		:aws_secret_key => ENV['S3_SECRET_KEY']
		}
		
		config.fog_directory = ENV['S3_BUCKET']
	end
end

