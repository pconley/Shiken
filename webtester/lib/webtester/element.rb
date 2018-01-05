class WT::Element
  
  def initialize(arg,src="xxx")
    # puts "element init arg=#{arg} src=#{src}"
    if !arg
      # sometimes we want to create an element from
      # a find that fails... so create a dummy element
      @locator = { src: src }
      @el = false
    elsif arg.instance_of?(Selenium::WebDriver::Element)
      @locator = { src: src }
      @el = arg
    else # it is a locator
      @locator = arg # remember
      @el = WT::Browser.find(arg)
      WT::Trace.debug "element locator=#{arg} el=#{@el}"
      WT::Trace.warn "element failed to initialize with locator = #{arg}" unless @el
    end
  end
  
  attr_reader :el
  attr_reader :locator
  
  def to_s
    "<WT::Element #{locator}>"
  end

  def exists?
    !!el
  end
  alias :exist? :exists?

  def displayed?
    puts "+++ element displayed?"
    WT::Browser.rescue_exceptions { self.el.displayed? } 
  end
  
  def html
    # useful to see for debugging
    self.el.attribute('innerHTML')
  end

  def enabled?
    puts "enabled? 1:#{exists?}"
    false unless exists?
    puts "enabled? 2:#{el.enabled?}"
    el.enabled?
  end

  def text
    # useful to see contents for debugging
    str1 = self.el ? self.el.text : ''
    # str2 = str1.gsub(/\n\s+/, " ") # shrink white space
    str1.gsub(/\n+/, " ").strip # remove new lines
  end
  
  def find(locator,klass=WT::Element)
    # trace "find #{locator} in #{self.locator}"
    child_el = find_child_el(locator)
    # trace "child el = #{child_el}"
    klass.new(child_el,"#{locator}")
  end
  alias :child :find

  def find_child_el(locator)
      # trace "find child of #{self.locator}. locator=#{locator}"
      # find an element by locator inside another element (base)
      case
      when locator.has_key?(:value)
        # trace "... locate by value: #{locator[:value]}}"
        search(:value,locator[:value]) 
      when locator.has_key?(:type)
        # trace "... locate by type: #{locator[:type]}" 
        search(:type,locator[:type]) 
      else
        # a standard selenium locator so just use selenium
        WT::Browser.rescue_exceptions { self.el.find_element(locator) } 
      end
  end

  def children(locator,klass=WT::Element)
      # get the matching children elements
      els = WT::Browser.rescue_exceptions { self.el.find_elements(locator) } 
      # but return as one of our class types
      els.map { |el| klass.new(el) }
  end

  def search(key,val)
    trace "element#search key=#{key} val=#{val}"
    # selenium does not support a locator search by type
    # so we need a specialized function to find the element
    elements = self.el.find_elements({})
    #elements = all({tag_name: 'input'})
    elements.find do |e| 
        # trace "> #{e.attribute(key)} :: #{val}"
        e.attribute(key) == val
    end
  end
    
  def parent_el
    self.el.find_element({xpath: ".."})
  end
    
end