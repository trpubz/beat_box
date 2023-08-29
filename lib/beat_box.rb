require 'linked_list'

class BeatBox
  attr_reader :list
  
  def initialize(data = nil)
    @list = LinkedList.new
    @rate = 500
    @voice = "Boing"
    append(data) if !data.nil?
  end

  def append(data)
    @list.append(data)
  end

  def prepend(data)
    @list.prepend(data)
  end

  def count
    @list.count
  end

  def all
    @list.to_string
  end

  def rate=(spd)
    @rate = spd
  end

  def reset_rate
    @rate = 500
  end

  def voice=(voice)
    @voice = voice
  end

  def reset_voice
    @voice = "Boing"
  end

  def play
    system "say #{"-r #{@rate}"} #{"-v #{@voice}"} #{@list.to_string}"
    return self.count
  end
end
