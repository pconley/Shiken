class WT::Cell < WT::Element

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
    "<WT::Cell #{@index} [#{self.text}]>"
  end

end

class WT::Row < WT::Element

  # row is an element that "remembers" it's index in the table

  attr_reader :index

  def initialize(locator,index)
    super(locator) # creates the el and locator
    @index = index # remember your position
  end

  def cells()
    ds = self.el.find_elements({tag_name: 'td'})
    ds.map.with_index { |e,i| WT::Cell.new(e,i) }
  end

  def to_s
    text = cells.map { |cell| cell.text }.join("][")
    "<WT::Row #{@index} [#{text}] >"
  end
end

class WT::Table < WT::Element

  def rows
    rs = self.el.find_elements({tag_name: 'tr'})
    WT::Trace.debug "WT::Table el rows length = #{rs.length}"
    ws = rs.map.with_index { |r,i| WT::Row.new(r,i) } 
    WT::Trace.debug "WT::Table wt rows length = #{ws.length}"
    ws # returned
  end
  
end