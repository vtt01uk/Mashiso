module ApplicationHelper
	def gravatar_for(chef, options = { size:80 })
		gravatar_id = Digest::MD5::hexdigest(chef.email.downcase)
		#pass in size parameter
		size = options[:size]
		#create url
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: chef.chefname, class: "gravatar")
	end
end
