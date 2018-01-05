Gem::Specification.new do |s|
  s.name        = 'webtester'
  s.version     = '0.1.0'
  s.date        = '2017-03-04'
  s.summary     = "A Selenium Facade"
  s.description = "A layer to simplify ruby use of selenium"
  s.authors     = ["Pat Conley"]
  s.email       = 'pconley312@gmail.com'
  s.files       = [
    "lib/webtester.rb",
    "lib/webtester/trace.rb",
    "lib/webtester/element.rb",
    "lib/webtester/field.rb",
    "lib/webtester/button.rb",
    "lib/webtester/radio_set.rb",
    "lib/webtester/dropdown.rb",
    "lib/webtester/page.rb",
    "lib/webtester/kendo.rb",
    "lib/webtester/browser.rb",
    "lib/webtester/downloads.rb"
  ]
  s.homepage    = 'http://rubygems.org/gems/webtester'
  s.license     = 'MIT'
end