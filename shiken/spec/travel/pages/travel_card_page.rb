require_relative "travel_base_page.rb"

class TravelCardPage < TravelBasePage
    
	def initialize()
    # note there is not really a seperate credt card
    # page, so the url is the same as the passenger page
    super('flights/passenger') 
  end
  
	def present?
    # but we know we are here if the URLs match
    # AND the specific text is present on the page
    self.here? 'Pay by Credit Card'
	end
  
  def card_number
    SK::Field.new({name: 'card_number'})
  end
  def card_type
    SK::RadioSet.new({name: 'card_type'})
  end
  def cc_month
    SK::Dropdown.new({name: "expiry_month" })
  end
  def cc_year
    SK::Dropdown.new({name: "expiry_year" })
  end
  def pay_button_el
    SK::Browser.find({ type: "submit" })
  end 
    
  def fill_card_details(card)
    card_type.select(card)
    card_number.set("1234567813246380")
    cc_month.select('12')
    cc_year.select('2018')
    pay_button_el.click()
    sleep 6
  end
    
end

$TravelCardPage = TravelCardPage.new()