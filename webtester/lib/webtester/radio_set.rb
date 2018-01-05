class WT::RadioSet
  
  def initialize(locator)
    # get all the elements for the radio
    @els = WT::Browser.all(locator)
    # trace("radio els = #{@els}")
  end
  
  def select(value)
    # trace("radio els = #{@els}")
    @els.each do |el|
       #trace "radio looking at #{el.text}: #{value}"
      if el.attribute('value') == value
        el.click
        break
      end
    end
  end
  
end