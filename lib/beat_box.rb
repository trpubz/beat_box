require 'linked_list'

class BeatBox
  attr_reader :list
  def initialize(data = nil)
    @list = LinkedList.new
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

  def play
    system "say -r 200 #{@list.to_string}"
  end
end
