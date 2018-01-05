require 'spec_helper.rb'

RSpec.describe "Travel Login Page" do

	before :each do
		$TravelLoginPage.goto
	end
  
  	after :each do
    	# NOTE: we cannot log out after each test!!!!
  	end
    
	it "is present" do
		expect($TravelLoginPage).to be_present
		expect($TravelLoginPage).to be_here("Remember me")
    	# cannot log out... never got in
	end
  
	it "has expected title" do
		expect($TravelLoginPage.title).to eq("Agile Travel")
    	# cannot log out... never got in
	end
  
	it "has expected labels" do
		expect($TravelLoginPage).to have_content("Login")
		expect($TravelLoginPage).to have_content("Agile Travel")
		expect($TravelLoginPage).to have_content("Register")
    	# cannot log out... never got in
	end
  
	it "has expected fields" do
		expect($TravelLoginPage.username).to exist
		expect($TravelLoginPage.password).to exist
		expect($TravelLoginPage.login_button).to exist
    	# cannot log out... never got in
	end
  
	it "can login with valid credentials" do
		$TravelLoginPage.fill_and_submit($good_user, $good_pass)
		expect($TravelFlightPage).to be_present
		$TravelLoginPage.logout
		expect($TravelLoginPage).to be_present
	end
  
	it "fails to login with invalid password" do
		$TravelLoginPage.fill_and_submit($good_user, "abc123")
		expect($TravelLoginPage).to have_content("Invalid email or password")
    	# cannot log out... never got in
	end
  
	it "fails to login with invalid credentials" do
		$TravelLoginPage.fill_and_submit("xuser", "xpassword")
		expect($TravelLoginPage).to have_content("Invalid email or password")
    # cannot log out... never got in
	end
  
end