require_relative 'spec_helper'

RSpec.describe 'google search' do
              
  it "can get to google" do
    WT::Browser.goto('www.google.com')
    # WT::Trace::trace WT::Browser.url
    expect(WT::Browser.url).to include('www.google.com')
  end
    
end