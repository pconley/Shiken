# README #

Shiken is a wepage test library that is a Ruby wrapper for selenium.

試験（しけん)

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

SK::init
SK::quit
SK::Trace
SK::Browser
SK::RadioSet
SK::Dropdown
```
*** rspec spec helper ***

Usually you want to use one browser session for an entire test suite execution, so you will put the init and quit into the spec_helper

```
#!ruby

RSpec.configure do |config|
     
  config.before :suite do
     SK::init()
  end

  config.after :suite do
    SK::quit()
  end
        
end
```

### SK::Trace ###

You can turn on/off the WT internal tracing by by setting the trace level using either a symbol or a number.  Normally, it is a good idea to leave the default set to :warn


```
#!ruby

SK::Trace.level = :debug # 3
SK::Trace.level = :warn  # 2 is the default
SK::Trace.level = :error # 1 
SK::Trace.level = :quiet # 0
SK::Trace.level = 3 # all tracing
SK::Trace.level = 2 # warnings and errors
SK::Trace.level = 1 # just errors
SK::Trace.level = 0 # no output
```