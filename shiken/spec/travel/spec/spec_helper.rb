#require_relative '../spec_helper.rb'
require 'webtester'

# add pages to the load path
dir = File.dirname(__FILE__)
$LOAD_PATH.unshift("#{dir}/../pages")

require 'travel_login_page.rb'
require 'travel_flight_page.rb'
require 'travel_passenger_page.rb'
require 'travel_card_page.rb'

require 'session_travel.rb'

$good_user = "agileway"
$good_pass = "testwise"

RSpec.configure do |config|

  config.before :suite do |x|
     # puts "*** before suite"
     WT::init()
  end

  config.after :suite do |x|
    # puts "*** after suite"
    WT::quit()
  end
          
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

def trace(text)
  WT::Trace.trace(text)
end

def pause(s,text='')
  WT::Trace.trace("pausing #{s} seconds #{text}")
  sleep s
end