require 'selenium-webdriver'

# NOTE: the requires are at bottom

module SK
  
  @driver = nil
  
  extend self
        
  def version
    v = "0.0.1"
    # Trace.trace "version: #{v}"
    return v
  end
  
  def init(seconds=2, browser=:safari)
    
    # browser_stack_url = "http://patconley2:LBqJyYGj5TsyNBWe2Bjy@hub.browserstack.com/wd/hub"
    # $driver = Selenium::WebDriver.for(:remote, :url => browser_stack_url)
    
    # Trace.trace "SK::init"
    # seconds = max time to wait for the element to appear
    wait = Selenium::WebDriver::Wait.new(:timeout => seconds)
        
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile["javascript.enabled"] = false # NOT SURE WHY????
    # trace "wt init download path = #{SK::Downloads.path}"
    profile['browser.download.dir'] = SK::Downloads.path
    #
    # # The value of browser.download.folderList can be set to either 0, 1, or 2.
    # # When set to 0, Firefox will save all files downloaded via the browser on the
    # # user's desktop. When set to 1, these downloads are stored in the Downloads folder.
    # # When set to 2, the location specified for the most recent download is utilized again
    profile['browser.download.folderList'] = 2  # use the specified directory
      
    # Suppress "open with" dialog for a file types    
    profile['browser.helperApps.neverAsk.saveToDisk'] = "text/csv,application/pdf,application/xls,image/tiff"
    profile['browser.helperApps.alwaysAsk.force'] = false    
    # disable Firefox's built-in PDF viewer
    profile["pdfjs.disabled"] = true
    # disable Adobe Acrobat PDF preview plugin
    profile["plugin.scan.plid.all"] = false
    profile["plugin.scan.Acrobat"] = "99.0"
    
    @driver = Selenium::WebDriver.for(browser)

    # NOTE 3/4/17 the profile code failed for safari... see use of FIREFOX in creating profile!!

    # @driver = Selenium::WebDriver.for(browser, :profile => profile)
    # $driver = Selenium::WebDriver.for :firefox # :safari :chrome
    
    # TODO: what does this do... overried the above???
    # @driver.manage.timeouts.implicit_wait = 5
    
    @driver # returned ????
  end
  
  def quit
    # Trace.trace "SK::quit"
    driver.quit if driver 
    @driver = nil 
  end
  
  def driver
    @driver
  end
    
end

require 'shiken/trace'
require 'shiken/browser'
require 'shiken/page'
require 'shiken/element'
require 'shiken/field'
require 'shiken/clickable'
require 'shiken/button'
require 'shiken/link'
require 'shiken/dropdown'
require 'shiken/radio_set'
require 'shiken/kendo'
require 'shiken/table'
require 'shiken/downloads'
