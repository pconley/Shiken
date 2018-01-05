require 'selenium-webdriver'
require 'shiken/trace'
require 'uri'

module SK::Browser
  
  extend self 
  
  ### local utilities
  
  def pause(secs,text="")
    trace("pause #{secs} seconds #{text}")
    sleep secs
  end
  def trace(s)
    SK::Trace.trace(s)
  end
  def error(s)
    SK::Trace.error(s)
  end
  def warn(s)
    SK::Trace.notice(s)
  end
  
  ###### main stuff #########
  
  def goto(site,page='')
    gotourl("https://#{site}/#{page}")
  end
  def gotox(site,page='')
    gotourl("http://#{site}/#{page}")
  end
  def gotourl(url,seconds=1)
    uri = URI.escape(url)
    puts("go to #{uri}")
    rescue_exceptions { SK::driver.get uri }
    sleep seconds
  end
    
  def option(dd)
      warn "browser.option is depricated. use SK::Dropdown instead"
      Selenium::WebDriver::Support::Select.new(dd)
   end

  def select(locator,value)
      dropdown(locator,"option",value)
  end

  def dropdown(locator,tagname,list_option)
      warn "browser.dropdown is depricated. use SK::Dropdown instead. locator=#{locator}"
      # actually returns the option object for the dropdown
      # so the calling code can chain a select by method
      # option(find({name: name}))
      select_box = find(locator)
      # select_box = $driver.find_element(locator)
      _dropdown_el(select_box,tagname,list_option)
  end
    def _dropdown_el(select_box,tagname,list_option)
      # trace "dropdown el... select_box=#{select_box}"
      # trace "dropdown el... tagname=#{tagname} option=#{list_option}"

      # actually returns the option object for the dropdown
      # so the calling code can chain a select by method
      # option(find({name: name}))
      options = select_box.find_elements(:tag_name => "#{tagname}")

      options.each do |option_field|
        # trace "looking at #{option_field.text}"
        if option_field.text == "#{list_option}"
          option_field.click
          break
        end
      end
    end

    def search(base_locator,target_locator,value,attr='text')
      # search within the locator element for all matching tags (by name)
      # return that element that has the attribute of text that matches
      # the text_value passed 
      element = find(base_locator)
      unless element # was found
        error "wt search: element not found. locator = #{base_locator}"
        return false
      end
      elements = element.find_elements(target_locator)
      elements.each do |el|
        el_attr = _get_attribute(el,attr)
        # trace "wt search at #{el_attr} for #{value}"
        return el if el_attr == "#{value}"          
      end
      return false
    end
    
    def _get_attribute(el,attr)
      attr == 'text' ? el.text : el.attribute(attr)
    end

    def radio(locator)
      warn "browser.radio is depricated. use SK::RadioSet instead. locator=#{locator}"
      self.click(locator,0)
    end

    def set(locator,value)
      # set now accepts a single or an
      # array of locators, by using newfind
      el = find(locator)
      error "cannot set #{locator}" unless el
      _set_el(el,value) if el
    end
    def _set_el(el,value)
      el.clear
      el.send_keys(value)
    end

    def submit(name,secs=1)
      click(name: name)
      sleep secs
    end

    def find(param)
      # find accepts a single value or array
      # of locators to find an element.  the array
      # is meant to be a this under this structure
      if param.kind_of?(Array)
        base = driver
        param.reverse.each do |loc|
          base = _find_inside(loc,base)
        end  
        return base     
      else
        # not an array, a single
        _find_inside(param,driver)
      end
    end
        
    def _find_inside(locator, base)
      # trace "find inside. locator=#{locator} base=#{base}"
      # find an element by locator inside another element (base)
      case
      when locator.has_key?(:value)
        # trace "... locate by value: #{locator[:value]}}"
        find_input(:value,locator[:value]) 
      when locator.has_key?(:type)
        # trace "... locate by type: #{locator[:type]}" 
        find_input(:type,locator[:type]) 
      else
        # a standard selenium locator so just use it
        rescue_exceptions { base.find_element(locator) } 
      end
    end
    
    def find_input(key,type)
      # selenium does not support a locator search by type
      # so we need a specialized function to find the element
      elements = all({tag_name: 'input'})
      elements.find do |e| 
        # trace "> #{e.attribute(key)} :: #{type}"
        e.attribute(key) == type
      end
    end
  
    def all(locator)
      rescue_exceptions { driver.find_elements(locator) }
    end
  
    def match(text,locator)
      elements = all(locator)
      # trace("searching #{elements.length} links...")
      elements.find{ |e| e.text.include? text }
    end
  
    def count_refs(ref, locator)
      elements = all(locator)
      # trace("count from #{elements.length} links...")
      elements.count{ |e| e.attribute('href').include? ref }    
    end   
 
    def has_content?(content)
      # puts trace("has content? #{content}")
      return self.source.include? content
    end

    def has_el?(locator)
      find(locator)
      # rescue_exceptions { driver.find_element(locator) }
    end
    
    def has_text?(locator,text)
      find(locator).text == text
    end
    
    def get_rows(locator,less_row)
      rest  = less_row.to_i
      #table = rescue_exceptions { driver.find_elements(table_count) }
      table = all(locator)
      return table.count-rest
    end

    def get_text(locator)
      find(locator).text
      # return rescue_exceptions { driver.find_element(locator).text }
    end
    
    def get_value(locator)
      find(locator).attribute('value')
    end
    
    ### Actions ####
    
    def click(locator,pause=0)
      SK::Trace.trace("*** click is depricated")
      el = find(locator)
      _click_el(el,pause) if el
    end
    
    def _click_el(el,extra)
      SK::Trace.trace("*** click_el")
      rescue_exceptions { el.click }
      sleep 1+extra
      self
    end
    
    ### Key Core Operations ###
    
    def rescue_exceptions
      # we do not want our tests to fail because selenium throws an error
      # instead we want to explicitly test using "expects" in the cases
      begin
        yield
      rescue Selenium::WebDriver::Error::NoSuchElementError
        warn "Element does not exist."
        false
      rescue Selenium::WebDriver::Error::StaleElementReferenceError
        warn "Element is stale."
        false
      rescue Selenium::WebDriver::Error::ElementNotVisibleError
        warn "Element is not visible."
        false
      rescue Selenium::WebDriver::Error::WebDriverError => e
        error "Webdriver Error. #{e}"
        false
      rescue Net::ReadTimeout
        error "Network Timeout - no response."
        false
      rescue IOError   
        error "IOError"
        false
      end
    end
     
    ### Simple Accessors ####

    def driver
      SK::driver
    end    
    def source
      driver.page_source
    end
    def url
      driver.current_url
    end
    def title
      driver.title
    end
           
end