# Shiken [試験] #

Shiken is a ruby gem that is a wrapper for selenium.  In my experience, many people write "scripts" using selenium - not "tests".  The difference being you can start a set of tests and walk away... then come back and find out what passed or failed.  Scripts are something you have to watch to see what is going on.  Using rspec is key to writing tests.

There are other similar frameworks... this is just my own way of digging into automation test and techniques (and ruby code for that matter).

Shiken is the Japanese word for test.

### Project Design Philosopy ###

* the test pyramid
* rely on unit tests
* but have sanity tests
* test on production
* use page oriented tests
* good tests require programming
* test clean up after themselves
* you can run test individually

### Contribution guidelines ###

* there are currently no contributors... be the first!

### Who do I talk to? ###

* Pat Conley pconley312@gmail.com

## About the gem

This site is for the developer that wants to look into the gem... not the tester who uses the gem. See the companion github page called ShikenExamples for stand alone examples of how to use of the gem with rspec.

### gem basics
```
gem list           # see list of install
gem cleanup xxx    # remove all old versions of the gem
gem uninstall xxx  # choose which ones you want to remove
```
### dependencies

colorize (for pretty output)
```
gem install colorize
gem install selenium-webdriver
```

I also added geckodriver to /usr/local/bin to get it working

## Build Notes

I do not get back to this project but every few months, so here are some quick start notes to myself that the reader may find useful if you want to copy and adapt this code for your own use.  The real deatils for gem creation are at...

[Gem Guide]: http://guides.rubygems.org/make-your-own-gem/ "details on building gems"

Clone me. 

Make your changes... update the unit tests!

Seperately run each the unit tests.
```
rspec spec/api		# sanity to see if installed
rspec spec/google	# can we create a simple session
rspec spec/travel	# full blown set of feature tests
```
Change the shiken.gemspec file to update the version. Note: be positioned in the top directory (where gemspec file lives).
```
gem build shiken.gemspec
```
The new gemfile is now present in the same directory.  You can install from the current directory.
```
sudo gem install ./shiken-0.0.X.gem
```
You can confirm what is installed... and there may be older versions
```
gem list | grep shiken
```
The real developer (me) can then push the gem to the public repository.
```
gem push shiken-0.0.4.gem    # to push to rubygems.org
```
### A simple rspec example ###
So, what would a test look like using shiken?  This is an example from the travel project that uses the session and page objects to extract the test(s) from the (resuable) login/out steps and specific page elements.  This example has 4 independent tests... each wrapped in the start and stop of a session.

```
require 'spec_helper.rb'

describe "Agile Travel - Select Flight Page" do
	
	before :each do
		TravelSession.start()
		$TravelFlightPage.goto
    	expect($TravelFlightPage).to be_present
	end
  
  	after :each do
		TravelSession.stop
  	end
	
	it "has correct title" do
		expect($TravelFlightPage.title).to eq("Agile Travel")
	end
  
	it "has expected labels" do
		expect($TravelFlightPage).to have_content("Select Flight")
		expect($TravelFlightPage).to have_content("Trip type:")
		expect($TravelFlightPage).to have_content("Departing: ")
	end

	it "can fill two-way and get to passenger" do
		$TravelFlightPage.fill_flight_return_details
		expect($TravelPassengerPage).to be_present
  	end
  
  	it "can fill one-way and get to passenger" do
		$TravelFlightPage.fill_flight_oneway_details
		expect($TravelPassengerPage).to be_present
  	end
end

```
