# Shinken : the gem

This page/folder is for the developer that wants to look into the gem... not the tester who uses the gem. 
See the "travel" folder for exampls and documentation on how to make use of the gem.

# gem basics

gem list           # see list of install
gem cleanup xxx    # remove all old versions of the gem
gem uninstall xxx  # choose which ones you want to remove

# dependencies

colorize (for pretty output)

gem install colorize
gem install selenium-webdriver
added geckodriver to /usr/local/bin


# Build Notes

[Gem Guide]: http://guides.rubygems.org/make-your-own-gem/ "details on building gems"

---> make your changes

Seperately run each the unit tests.

rspec spec/api		# sanity to see if installed
rspec spec/google	# can we create a simple session
rspec spec/travel	# full blown set of feature tests

--> change the shiken.gemspec file to update the version
--> be positioned in the shiken directory (where gemspec file is)

gem build shiken.gemspec

---> the gemfile is now present in the same directory

sudo gem install ./shiken-0.0.X.gem

// to confirm... and there may be older versions

gem list | grep shiken
