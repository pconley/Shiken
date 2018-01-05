require_relative 'spec_helper.rb'

describe "Travel Card Page" do
	
	before :each do
		TravelSession.start
    $TravelFlightPage.goto
    $TravelFlightPage.fill_flight_return_details
    $TravelPassengerPage.fill_passenger_details
    expect($TravelCardPage).to be_present
	end
  
  after :each do
		TravelSession.stop
  end

	it "Has A Title" do
		expect(WT::Browser.title).to eq("Agile Travel")
	end
  
	it "Must Contain The Labels" do
		expect(WT::Browser).to have_content("Pay by Credit Card")
		expect(WT::Browser).to have_content("Card type: ")
		expect(WT::Browser).to have_content("Card number: ")
	end

 	it "fill visa credit card details" do
    $TravelCardPage.fill_card_details('visa')
    sleep 5 # seems to take a really long time to return
		expect(WT::Browser).to have_content("Confirmation")
	end

	it "fill master credit card details" do
    $TravelCardPage.fill_card_details('master')
    sleep 5 # seems to take a really long time to return
		expect(WT::Browser).to have_content("Confirmation")
	end
end