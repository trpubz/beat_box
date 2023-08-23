require 'node'

class Linked_List
  attr_reader :head

  def initialize
    @head
  end

  def append(data)
    new = Node.new(data)
    @head = new
  end

  def count
    _, count = nodder
    return count
  end

  def to_string
    str, _ = nodder
    return str
  end

  def nodder
    str = ''
    counter = 0
    node = @head
    until node.nil?
      str << node.data.to_s + ' '
      counter += 1
      node = node.next_node
    end
    return str.chomp(' '), counter
  end
end
