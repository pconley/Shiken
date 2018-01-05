Gem::Specification.new do |s|
  s.name        = 'shiken'
  s.version     = '0.0.4'
  s.date        = '2018-01-05'
  s.summary     = "A Selenium Facade in Ruby"
  s.description = "A layer to simplify ruby use of selenium"
  s.authors     = ["Pat Conley"]
  s.email       = 'pconley312@gmail.com'
  s.files       = [
    "lib/shiken.rb",
    "lib/trace.rb",
    "lib/element.rb",
    "lib/field.rb",
    "lib/link.rb",
    "lib/clickable.rb",
    "lib/button.rb",
    "lib/radio_set.rb",
    "lib/dropdown.rb",
    "lib/page.rb",
    "lib/kendo.rb",
    "lib/table.rb",
    "lib/browser.rb",
    "lib/downloads.rb"
  ]
  s.homepage    = 'https://github.com/pconley/Shiken.git'
  s.license     = 'MIT'
end