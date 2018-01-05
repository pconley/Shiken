require 'travel_login_page.rb'
require 'travel_flight_page.rb'
require 'travel_passenger_page.rb'


RSpec.shared_examples "a base page" do
	it "fill the login form" do
		page.filling_login_fields
		sleep 2
		expect(CurrentPage).to have_content("Signed in!")
	end
end

RSpec.shared_examples "a fly page" do
	it "fill the round fly form" do
		page.filling_return_fields
		sleep 2
		expect(CurrentPage).to have_content(" (return trip)")
	end
	it "fill one way fly page" do
		page.filling_oneway_fields
		sleep 2
		expect(CurrentPage).to have_content(" (oneway trip)")
	end
end

RSpec.shared_examples "a passenger details page" do
	it "fill the passenger details form" do
		page.fill_passenger_fields
		sleep 2
		expect(CurrentPage).to have_content("Pay by Credit Card")
	end
	it "fill credit visa card details form" do
		page.fill_passenger_fields
		page.fill_visa_card_fields
		sleep 8
		expect(CurrentPage).to have_content("Confirmation")
	end
	it "fill credit Master card details form" do
		page.fill_passenger_fields
		page.fill_master_card_fields
		sleep 8
		expect(CurrentPage).to have_content("Confirmation")
	end
end