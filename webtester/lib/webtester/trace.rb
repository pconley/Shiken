require 'colorize'

module WT::Trace
  
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
    write "WT::Trace : #{s}".cyan, DEBUG
  end  
  def debug(s)
    write "WT::Debug : #{s}".cyan, DEBUG
  end
  def error(s)
    write "WT::Error: #{s}".red, ERROR
  end
  def notice(s)
    write "WT::Notice: #{s}".yellow, WARN
  end
  def warn(s)
    write "WT::Warn  : #{s}".yellow, WARN
  end
  
  def write(text,lev)
    puts text if level >= lev
  end

  # def xfail(num,s)
  #   error num, s
  #   fail
  # end

end
