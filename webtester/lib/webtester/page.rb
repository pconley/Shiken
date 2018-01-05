# TODO: move some of the browser methods to page

class WT::Page
  
  def initialize(base,page)
    @url = "#{base}/#{page}"
  end  
      
  def url
    @url
  end
  
  # def goto
  #   WT::Browser.gotox(url)
  # end

  def goto(opts={})
    query = opts.map { |k,v| k.to_s+"="+v.to_s }.join("&")
    url = @url 
    url += "?" + query unless query == ""
    trace("goto: url=#{url}")
    WT::Browser.gotox(url)
  end 


  def present?
    urls_match?
  end

  def urls_match?
    # change to the looser include instead of equal
    return true if WT::Browser.url.include? self.url

    # return true if WT::Browser.url == self.url # old code

    # because we almost always need to see some clues when the expected page is 
    # not present we trace some outpout the the tester
    trace "WT::Page url_match? expected: #{url} did not match current: #{WT::Browser.url}"
    false # returned    
  end
  
  def has_content?(content)
    result = WT::Browser.source.include? content
    # trace "missing content = #{content}" unless result
    return result
  end
  
  def here?(text)
    return false unless urls_match?
    # urls do match, but also require that
    has_content? text
  end
  
  def source
    WT::Browser.source
  end
  
  def title
    WT::Browser.title
  end
  
end