require 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head
  end

  def valid?(data)
    white_list = "tee dee deep bop boop la na doop dop plop woo suu pfft deep woo shi shu blop deep doo ditt woo hoo shu"

    white_list.include?(data) ? true : false
  end

  def append(data)

    if data.split(" ").length > 1
      data.split(" ").each { |d| self.append(d) }
      return
    end

    return unless valid?(data)
    return unless head_present?(data)

    node = @head
    until node.next_node.nil?
      node = node.next_node
    end
    node.next_node = Node.new(data)
  end

  def prepend(data)
    if data.split(" ").length > 1
      data.split(" ").each { |d| self.prepend(d) }
      return
    end

    return unless valid?(data)
    return unless head_present?(data)

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
      returned_data << node.data + " "
      node = node.next_node
    end

    return returned_data.chomp(" ")
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
    prior_node = Node.new(nil) # instantiation for when popping the head
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

  def head_present?(data)
    if @head.nil?
      @head = Node.new(data)
      return false
    else
      return true
    end
  end

  def count
    _, count = nodder
    return count
  end

  def to_string
    str, _ = nodder
    return str
  end

  # node traverser that returns all strings & list size
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
