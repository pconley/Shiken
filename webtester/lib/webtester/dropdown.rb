class WT::Dropdown < WT::Element
  
  def initialize(locator)
    super(locator) # creates the el and locator via 
    WT::Trace.warn "Dropdown failed to initialize. locator = #{locator}" unless el
    @options = el.find_elements(tag_name: "option")  
  end
  
  def select(value)
    select_by('text',value)
  end
  
  def select_by(attr,value)
    @options.each do |option|
      optval = option.attribute(attr)
      # trace "looking at #{optval}"
      if optval == value
        option.click
        break
      end
    end
  end
  
  def select_index(index)
    n = [@options.length-1,index].min
    @options[n].click
    return @options[n].attribute('text')
  end
  
end