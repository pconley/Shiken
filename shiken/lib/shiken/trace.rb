require 'colorize'

module SK::Trace
  
  DEBUG = 3
  WARN  = 2
  ERROR = 1
  QUIET = 0
  
  extend self
  
  @level = DEBUG
  
  def level=(value)
    case value
    when :debug
      n = DEBUG
    when :warn
      n = WARN
    when :error
      n = ERROR
    when :quiet
      n = QUIET
    else
      n = value.to_i
    end
    @level = n
  end
  
  def level
    @level
  end
  
  def trace(s)
    write "SK::Trace : #{s}".cyan, DEBUG
  end  
  def debug(s)
    write "SK::Debug : #{s}".cyan, DEBUG
  end
  def error(s)
    write "SK::Error: #{s}".red, ERROR
  end
  def notice(s)
    write "SK::Notice: #{s}".yellow, WARN
  end
  def warn(s)
    write "SK::Warn  : #{s}".yellow, WARN
  end
  
  def write(text,lev)
    puts text if level >= lev
  end

  # def xfail(num,s)
  #   error num, s
  #   fail
  # end

end
