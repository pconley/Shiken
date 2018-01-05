require 'travel_login_page.rb'

module TravelSession
	class << self
    
  		def start(user=$good_user,pswd=$good_pass)
    		# trace("example session: start for #{user}")
        $TravelLoginPage.goto
    		$TravelLoginPage.fill_and_submit(user, pswd)
  		end
      
  		def stop
    		# trace("example session: stop")
        # should really work from any page
    		$TravelLoginPage.logout
  		end
      
	end
end