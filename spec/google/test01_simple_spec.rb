require_relative 'spec_helper'

RSpec.describe 'google search' do
              
  it "can get to google" do
    SK::Browser.goto('www.google.com')
    # SK::Trace::trace SK::Browser.url
    expect(SK::Browser.url).to include('www.google.com')
  end
    
end