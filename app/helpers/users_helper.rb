module UsersHelper

	# Cool gravatar helper for getting the image on the gravatar database
	# Hashes the registered user email to request the image at gravatar.com
	# Read more here https://en.gravatar.com/site/implement/images/
	
    def gravatar_for(email, size)
        gravatar_id = Digest::MD5::hexdigest(email)
        gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end

end