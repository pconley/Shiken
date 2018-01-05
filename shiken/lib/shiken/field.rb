class SK::Field < SK::Element
  
  def initialize(locator)
    super(locator) # creates the el and locator
  end
  
  def set(value)
    if self.el
      self.el.clear
      self.el.send_keys(value)
    else
      SK::Trace.error "SK::Field.set: element not initialized for #{locator}"
    end
  end
    
end