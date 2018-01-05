Gem::Specification.new do |s|
  s.name        = 'shiken'
  s.version     = '0.0.3'
  s.date        = '2018-01-05'
  s.summary     = "A Selenium Facade in Ruby"
  s.description = "A layer to simplify ruby use of selenium"
  s.authors     = ["Pat Conley"]
  s.email       = 'pconley312@gmail.com'
  s.files       = [
    "lib/shiken.rb",
    "lib/shiken/trace.rb",
    "lib/shiken/element.rb",
    "lib/shiken/field.rb",
    "lib/shiken/link.rb",
    "lib/shiken/clickable.rb",
    "lib/shiken/button.rb",
    "lib/shiken/radio_set.rb",
    "lib/shiken/dropdown.rb",
    "lib/shiken/page.rb",
    "lib/shiken/kendo.rb",
    "lib/shiken/table.rb",
    "lib/shiken/browser.rb",
    "lib/shiken/downloads.rb"
  ]
  s.homepage    = 'https://github.com/pconley/Shiken.git'
  s.license     = 'MIT'
end