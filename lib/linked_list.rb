require 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head
  end

  def pend(data, pend_method)
    if data.split(" ").length > 1
      data.split(" ").each { |d| pend_method.call(d) }
      return false
    end
    valid?(data) ? head_present?(data) : false
  end

  def append(data)
    return if pend(data, method(:append)) == false

    node = @head
    until node.next_node.nil?
      node = node.next_node
    end
    node.next_node = Node.new(data)
  end

  def prepend(data)
    return if pend(data, method(:prepend)) == false

    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  def insert(index, data)
    # inserts the data if no head exists regardless of index
    return unless head_present?(data)
    node = @head
    index_tracker = 0
    while !node.nil?
      # if index is 1 ahead of tracker
      if index == index_tracker + 1
        new_node = Node.new(data)
        # assign the current node.next_node to the new node's next node
        new_node.next_node = node.next_node
        node.next_node = new_node
        return
      end
      node = node.next_node
      index_tracker += 1
    end
    # if node is nil, index was higher than allowed
    # puts "index out of range; no data added"
  end

  def find(starting_index, num_nodes)
    returned_data = ''

    node = @head

    starting_index.times do
      node = node.next_node
    end
    num_nodes.times do
      returned_data << node.data + ' '
      node = node.next_node
    end

    return returned_data.strip
  end

  def includes?(data)
    node = @head
    until node.nil?
      return true if node.data == data
      node = node.next_node
    end
    return false
  end

  def pop
    node = @head
    prior_node = Node.new(nil) # instantiation needed when popping the head
    until node.next_node.nil?
      prior_node = node
      node = node.next_node
    end

    prior_node.next_node = nil
    pop_data = node.data
    # need to erase head if it's being popped
    @head = nil if node == head
    return pop_data
  end


  # helper method
  def valid?(data)
    white_list = "tee dee deep bop boop la na doop dop plop woo suu pfft deep woo shi shu blop deep doo ditt woo hoo shu"

    white_list.include?(data) ? true : false
  end

  # helper method
  def head_present?(data)
    if @head.nil?
      @head = Node.new(data)
      return false
    else
      return true
    end
  end

  def count
    _, count = node_traverser
    return count
  end

  def to_string
    str, _ = node_traverser
    return str
  end

  # returns all strings & list size
  def node_traverser
    str = ''
    counter = 0
    node = @head
    until node.nil?
      str << node.data.to_s + ' '
      counter += 1
      node = node.next_node
    end
    return str.strip, counter
  end
end
