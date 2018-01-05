class TravelBasePage < SK::Page
  
  def initialize(page)
    super('travel.agileway.net',page)
  end  
  
  def urls_match?
    # override the match function for partial match
    return true if SK::Browser.url.include? self.url
    trace "base page: urls do not match: #{SK::Browser.url} <> #{self.url}"
    false # returned
  end
    
  # THERE IS NO LOGOUT PAGE, BUT WE CAN LOGOUT FROM MOST PAGES
  # SO WE ADD THIS TO THE BASE PAGE WITH SOME SAFETY CODING
  
  LOGOUT_LINK = { link: 'Sign off' }

  def logout
    link_exists = SK::Browser.find(LOGOUT_LINK)
    if link_exists
  	  # trace('travel logout')
  	  SK::Browser.click(LOGOUT_LINK)
    else
  	  error("travel logout failed on current page #{url}")
      raise "logout failed on page #{url}"
    end
  end  
  
end