require_relative "travel_base_page.rb"

class TravelPassengerPage < TravelBasePage
  
  FNAME_FIELD = { name: "passengerFirstName" }
  LNAME_FIELD = { name: "passengerLastName" }

	def initialize()
    	super('flights/passenger')
  end
  
	def present?
    # we cannot compare URLs on this page
    self.source.include? 'Passenger Details'
	end
  
  def next_button_el
    WT::Browser.find({ type: "submit" })
  end
  	
  def fill_passenger_details(fname,lname)
    # trace('adding passenger details:  start')
  	WT::Browser.set(FNAME_FIELD, fname)
    WT::Browser.set(LNAME_FIELD, lname)
    #WT::Browser.click(NEXT_BUTTON)
    next_button_el.click()
    sleep 3
    # trace('adding passenger details:  finish')
  end

end

$TravelPassengerPage = TravelPassengerPage.new()