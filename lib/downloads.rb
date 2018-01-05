module SK::Downloads
  
  @path = nil

  extend self
  
  def path=(p)
    @path = p
  end
  
  def path
    @path = @path || determine_mac_path
  end

  def determine_mac_path
    parts = File.dirname(__FILE__).split("/")
    # will work for AR and PC on a Mac (for now)
    "/#{parts[1]}/#{parts[2]}/downloads"
  end
  
  def files
    # NOTE: every time this is called it goes out to the OS for
    # a fresh list of the files... we may want to change to a 
    # "refresh" or "readfiles" model for performance
    Dir["#{self.path}/*"]
  end

  def names    
    files.collect {|f| File.basename(f) }
  end
  
  def include?(filename)
    filepath = "#{path}/#{filename}"
    files.include? filepath
  end

  def last
    files.max_by {|f| File.mtime(f)}   
  end
  
  def last_name
    File.basename last # just the file name
  end
  
  def count
    files.length
  end
  
  # def first
  #   files.first
  # end
  
  # def first_content
  #   wait_for_download
  #   File.read(first)
  # end

  def wait_for_download
    Timeout.timeout(1) do
      sleep 0.1 until downloaded?
    end
  end

  def downloaded?
    !downloading? && files.any?
  end

  def downloading?
    files.grep(/\.part$/).any?
  end

  def delete_any(name)
    list = files.select { |f|  File.basename(f).include?(name)  } 
    FileUtils.rm_f(list)  
  end
  
  def delete_all
    FileUtils.rm_f(files)
  end
end