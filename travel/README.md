# README #

This is an example and/or test project to exercise all of the webtester gem.  We use
a sample website that exists at xxx (for this purpose, I think).  The tests themselves
are written in ruby/rspec.  So simply run...

rspec spec

### Who do I talk to? ###

* Pat Conley (pconley312@gmail.com)

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