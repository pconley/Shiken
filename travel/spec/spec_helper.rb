require 'shiken'

def trace(s)
  puts ">>> #{s}"
end

dir = File.dirname(__FILE__)
$LOAD_PATH.unshift("#{dir}/../pages")

require 'travel_login_page.rb'
require 'travel_flight_page.rb'
require 'travel_passenger_page.rb'
require 'travel_card_page.rb'

require 'session_travel.rb'

$good_user  = "agileway"
$good_pass  = "testwise"

RSpec.configure do |config|

  config.before :suite do |x|
     trace "before travel suite" 
     SK::init()    
  end
   
  config.after :suite do |x|
    trace "after travel suite"
    SK::quit()
  end
          
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

