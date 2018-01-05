require_relative 'spec_helper'

RSpec.describe 'WT API' do
            
  it "exists" do
    expect(WT).to_not be_nil
  end
  
  it "has expected API" do
    expect(WT::Page).to_not be_nil
    expect(WT::Field).to_not be_nil
    expect(WT::Trace).to_not be_nil
    expect(WT::Button).to_not be_nil
    expect(WT::Element).to_not be_nil
    expect(WT::RadioSet).to_not be_nil
    expect(WT::Dropdown).to_not be_nil
  end
  
  it "has kendo API support" do
    expect(WT::Kendo).to_not be_nil
    expect(WT::KGrid).to_not be_nil
    expect(WT::KRow).to_not be_nil
    expect(WT::KFilter).to_not be_nil
  end
  
  it "has Download API support" do
    expect(WT::Downloads).to_not be_nil
    expect(WT::Downloads.path).to_not be_nil
    expect(WT::Downloads.files).to_not be_nil
    expect(WT::Downloads.names).to_not be_nil
    # expect(WT::Downloads.include?).to_not be_nil
    expect(WT::Downloads.last).to_not be_nil
    expect(WT::Downloads.last_name).to_not be_nil
    expect(WT::Downloads.count).to_not be_nil
  end
  
  it "returns a version" do
    expect(WT.version).to eq("0.0.2")
  end
  
  it "can init a selenium session" do
    WT::init()
    expect(WT::driver).to_not be_nil
    WT::quit()
    expect(WT::driver).to be_nil
  end
    
end