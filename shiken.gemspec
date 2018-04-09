Gem::Specification.new do |s|
  s.name        = 'shiken'
  s.version     = '0.1.5'
  s.date        = '2018-04-08'
  s.summary     = "A Selenium Facade in Ruby"
  s.description = "A layer to simplify ruby use of selenium"
  s.authors     = ["Pat Conley"]
  s.email       = 'pconley312@gmail.com'
  s.files       = Dir['lib/[*.rb'] + Dir['spec/travel/*'] + Dir['spec/google/*']
  s.homepage    = 'https://github.com/pconley/Shiken.git'
  s.license     = 'MIT'
  s.add_development_dependency 'colorize', '~> 0.8'
  s.add_development_dependency "selenium-webdriver", '~> 3.8'
  s.executables << 'shiken'
end