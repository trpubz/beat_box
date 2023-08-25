require 'linked_list'

class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(data)
    @list.append(data)
  end
end
