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
    counter = 0
    node = @head
    until node.nil?
      node = node.next_node
      counter += 1
    end
    return counter
  end

  def to_string
    str = ''
    node = @head
    until node.nil?
      str << node.data.to_s + ' '
      node = node.next_node
    end
    return str.chomp(' ')
  end

  def nodder

  end
end
