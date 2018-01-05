# README #

GEM Version of the the webtest framework

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
* Dependencies
* Database configuration
* How to run tests
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact

### API Entry Points ###

```
#!ruby

WT::init
WT::quit
WT::Trace
WT::Browser
WT::RadioSet
WT::Dropdown
```
*** rspec spec helper ***

Usually you want to use one browser session for an entire test suite execution, so you will put the init and quit into the spec_helper

```
#!ruby

RSpec.configure do |config|
     
  config.before :suite do
     WT::init()
  end

  config.after :suite do
    WT::quit()
  end
        
end
```

### WT::Trace ###

You can turn on/off the WT internal tracing by by setting the trace level using either a symbol or a number.  Normally, it is a good idea to leave the default set to :warn


```
#!ruby

WT::Trace.level = :debug # 3
WT::Trace.level = :warn  # 2 is the default
WT::Trace.level = :error # 1 
WT::Trace.level = :quiet # 0
WT::Trace.level = 3 # all tracing
WT::Trace.level = 2 # warnings and errors
WT::Trace.level = 1 # just errors
WT::Trace.level = 0 # no output
```