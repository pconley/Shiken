require 'shiken'

RSpec.configure do |config|

  config.before :suite do |x|
     # puts "*** before suite" 
     SK::init()    
  end
   
  config.after :suite do |x|
    # puts "*** after suite"
    SK::quit()
  end
          
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
