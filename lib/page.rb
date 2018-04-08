# TODO: move some of the browser methods to page

class SK::Page
  
  def initialize(base,page)
    @url = "#{base}/#{page}"
  end  
      
  def url
    @url
  end
  
  # def goto
  #   SK::Browser.gotox(url)
  # end

  def goto(opts={})
    query = opts.map { |k,v| k.to_s+"="+v.to_s }.join("&")
    url = @url 
    url += "?" + query unless query == ""
    SK::Trace.trace("goto: url=#{url}")
    SK::Browser.gotox(url)
  end 


  def present?
    urls_match?
  end

  def urls_match?
    # change to the looser include instead of equal
    return true if SK::Browser.url.include? self.url

    # return true if SK::Browser.url == self.url # old code

    # because we almost always need to see some clues when the expected page is 
    # not present we trace some outpout the the tester
    SK::Trace.trace "SK::Page url_match? expected: #{url} did not match current: #{SK::Browser.url}"
    false # returned    
  end
  
  def has_content?(content)
    result = SK::Browser.source.include? content
    # SK::Trace.trace "missing content = #{content}" unless result
    return result
  end
  
  def here?(text)
    return false unless urls_match?
    # urls do match, but also require that
    has_content? text
  end
  
  def source
    SK::Browser.source
  end
  
  def title
    SK::Browser.title
  end
  
end