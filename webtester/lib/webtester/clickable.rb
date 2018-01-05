class WT::Clickable < WT::Element

  # a clickable element can be created with a custom delay
  # so that the tester does not have to set the delay at 
  # every calling point... just once at the creation oint
  
  def initialize(locator,delay: 0)
    super(locator) # creates the el and locator
    @delay = delay
  end
  
  def click(delay = @delay)
    if self.el
      # WT::Trace.trace "WT::Clickable.click #{self.locator} #{self.el}"
      self.el.click
      sleep delay
    else
      WT::Trace.error "WT::Clickable.click: element not initialized for #{locator}"
    end
  end
    
end