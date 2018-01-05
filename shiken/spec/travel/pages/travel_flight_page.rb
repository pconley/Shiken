require_relative "travel_base_page.rb"

class TravelFlightPage < TravelBasePage
  
  def initialize()
    super('flights/start') 
  end
  
	def present?
    self.here? 'Select Flight'
	end
  
  def trip_type
    SK::RadioSet.new({name: 'tripType'})
  end
  def orig_port
    SK::Dropdown.new({ name: "fromPort" })
  end
  def dest_port
    SK::Dropdown.new({ name: "toPort" })
  end
  def depart_day
    SK::Dropdown.new({ id: "departDay" })
  end
  def depart_month
    SK::Dropdown.new({ id: "departMonth" })
  end
  def return_day
    SK::Dropdown.new({ id: "returnDay" })
  end
  def return_month
    SK::Dropdown.new({ id: "returnMonth" })
  end
  def continue_button
    SK::Browser.find({ type: "submit" })
  end
  
  
  def fill_flight_return_details
      # trace('adding twoway trip details:  start')
      trip_type.select('return')
      orig_port.select("San Francisco")
      dest_port.select("Sydney")
      depart_day.select("15")
      depart_month.select("May 2016")
      return_day.select("15")
      return_month.select("June 2016")
      continue_button.click()    
      sleep 3  
      # trace('adding twowy trip details:  finish')
  end
  
  def fill_flight_oneway_details
      # trace('adding oneway trip details:  start')
      trip_type.select('oneway')  
      orig_port.select("New York")
      dest_port.select("Sydney")
      depart_day.select("15")
      depart_month.select("September 2016")
      continue_button.click()
      sleep 3
      # trace('adding oneway trip details:  finish')   
  end
  
end

$TravelFlightPage = TravelFlightPage.new()