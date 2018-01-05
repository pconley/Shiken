require_relative 'spec_helper'

RSpec.describe 'SK API' do
            
  it "exists" do
    expect(SK).to_not be_nil
  end
  
  it "has expected API" do
    expect(SK::Page).to_not be_nil
    expect(SK::Field).to_not be_nil
    expect(SK::Link).to_not be_nil
    expect(SK::Table).to_not be_nil
    expect(SK::Trace).to_not be_nil
    expect(SK::Button).to_not be_nil
    expect(SK::Element).to_not be_nil
    expect(SK::RadioSet).to_not be_nil
    expect(SK::Dropdown).to_not be_nil
    expect(SK::Clickable).to_not be_nil
  end
  
  it "has kendo API support" do
    expect(SK::Kendo).to_not be_nil
    expect(SK::KGrid).to_not be_nil
    expect(SK::KRow).to_not be_nil
    expect(SK::KFilter).to_not be_nil
  end
  
  it "has Download API support" do
    expect(SK::Downloads).to_not be_nil
    expect(SK::Downloads.path).to_not be_nil
    expect(SK::Downloads.files).to_not be_nil
    expect(SK::Downloads.names).to_not be_nil
    # expect(SK::Downloads.include?).to_not be_nil
    expect(SK::Downloads.last).to_not be_nil
    expect(SK::Downloads.last_name).to_not be_nil
    expect(SK::Downloads.count).to_not be_nil
  end
  
  it "returns a version" do
    expect(SK::version).to eq("0.0.1")
  end
  
  it "can init a selenium session" do
    SK::init()
    expect(SK::driver).to_not be_nil
    SK::quit()
    expect(SK::driver).to be_nil
  end
    
end