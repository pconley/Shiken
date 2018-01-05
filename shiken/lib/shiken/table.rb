class SK::Cell < SK::Element

  # row is an element that "remembers" it's index in the row

  attr_reader :index

  def initialize(locator,index)
    super(locator) # creates the el and locator
    @index = index # remember your position
  end

  def as_num
    # trace "cell = #{cell.text}"
    sign = self.text.include?('(') ? -1 : 1
    sign * self.text.gsub(/[$,()]/, '').to_f
  end

  def to_s
    "<SK::Cell #{@index} [#{self.text}]>"
  end

end

class SK::Row < SK::Element

  # row is an element that "remembers" it's index in the table

  attr_reader :index

  def initialize(locator,index)
    super(locator) # creates the el and locator
    @index = index # remember your position
  end

  def cells()
    ds = self.el.find_elements({tag_name: 'td'})
    ds.map.with_index { |e,i| SK::Cell.new(e,i) }
  end

  def to_s
    text = cells.map { |cell| cell.text }.join("][")
    "<SK::Row #{@index} [#{text}] >"
  end
end

class SK::Table < SK::Element

  def rows
    rs = self.el.find_elements({tag_name: 'tr'})
    SK::Trace.debug "SK::Table el rows length = #{rs.length}"
    ws = rs.map.with_index { |r,i| SK::Row.new(r,i) } 
    SK::Trace.debug "SK::Table wt rows length = #{ws.length}"
    ws # returned
  end
  
end