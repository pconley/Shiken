class WT::KElement
  
  def initialize(el)
    @element = el
  end

  def el
    @element
  end

  def exists?
    !!el
  end

  def text
    # useful to see for debugging
    self.el.text
  end
  
  def html
    # useful to see for debugging
    self.el.attribute('innerHTML')
  end
  
end

class WT::KCell < WT::KElement
  def as_num
    # trace "cell = #{cell.text}"
    sign = self.text.include?('(') ? -1 : 1
    sign * self.text.gsub(/[$,()]/, '').to_f
  end
end

class WT::KRow < WT::KElement
  def cells()
    self.el.find_elements({tag_name: 'td'}).collect{ |e| WT::KCell.new(e) }
  end
end

class WT::KGrid < WT::KElement
  def initialize(locator={id: 'grid'})
    super(WT::Browser.find(locator))
  end
  def grid
    el
  end
  def items_label()
    return nil unless grid
    self.grid.find_element({class: 'k-pager-info'})
  end
  def items_count()
    return 0 unless self.grid
    return 0 unless self.items_label
    # trace "*** items label = #{self.items_label.text}"
    count = /(\d*) items/.match(self.items_label.text)[1].to_i
    return count
  end
  def pages_count
    last_page_button.attribute('data-page').to_i
  end
  def last_page_button
    self.grid.find_element({class: 'k-pager-last'})
  end
  def first_page_button
    self.grid.find_element({class: 'k-pager-first'})
  end
  def prev_page_button
    # there is an easily identifiable span inside the button
    span = self.grid.find_element({class: 'k-i-arrow-w'})
    span.find_element({xpath: '..'})
  end
  def next_page_button
    # there is an easily identifiable span inside the button
    span = self.grid.find_element({class: 'k-i-arrow-e'})
    span.find_element({xpath: '..'})
  end
  def rows
    set = self.grid.find_elements({tag_name: 'tr'})
    # trace "wt grid rows length = #{set.length}"
    set
  end
  def row(n)
    WT::KRow.new(self.rows[n])
  end
  
end

class WT::KFilter
  def initialize(n)
    @filter = nil # in case of error    
    # first check that the current page has a kendo grid
    grid = WT::KGrid.new()
    return if ! grid 
    # then work our way throught the page/grid...
    # list of all the column headers; this is a little
    # fragile if the page has other tables before the grid
    th_list = WT::Browser.all({tag_name: 'th'})
    return if !th_list
    return if th_list.length < n
    header = th_list[n] # the nth header for the column
    # puts "attribute = #{header.attribute('data-field')}"
    @filter = header.find_element({class: 'k-grid-filter'})
    # puts "find filter = #{@filter}"
  end
  def click
    # puts "click filter = #{@filter}"
    @filter.click() # makes AC it visible
    # pause 1
  end
  def clear
    buttons = WT::Browser.all({tag_name: 'button'})
    button = buttons.find { |el| el.text == 'Clear' } 
    button.click if button
    sleep 1
  end
  def select(value)
    containers = WT::Browser.all({class: 'k-animation-container'})
    container = containers.find { |c| c.displayed? }
    sleep 1 # to find the textbox???
    textbox = container.find_element({class: 'k-textbox'})
    trace "filter's textbox is not visisble" unless textbox.displayed?
    textbox.send_keys(value)    
    button = container.find_element({class: 'k-primary'})
    button.click()
    sleep 1
  end
end

module WT::Kendo
  class << self 
  
    def grid()
      return WT::KGrid.new()
    end

  end
end