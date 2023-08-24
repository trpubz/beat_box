require './lib/linked_list'
require './lib/node'

describe LinkedList do
  list = LinkedList.new
  # p list
  it 'should be a LinkedList' do
    expect(list).to be_a LinkedList
  end

  it 'should have a head' do
    expect(list.head).to be_nil
  end

  it 'should append a node' do
    list.append('doop')
    # p list
    expect(list.head).to be_a Node
  end

  it 'should be able to access the head.data' do
    expect(list.head.data).to eq 'doop'
  end

  it 'should be able to access the head.next_node' do
    expect(list.head.next_node).to be_nil
  end

  it 'should be able to count itself' do
    expect(list.count).to eq 1
  end

  it 'should be able to convert it\'s nodes data to a string' do
    expect(list.to_string).to eq 'doop'
  end

  it 'should be able to append another node' do
    list.append('deep')
    # p list
    expect(list.head.next_node).to be_a Node
  end

  it 'should be able to count itself' do
    expect(list.count).to eq 2
  end

  it 'should be able to convert it\'s nodes data to a string' do
    expect(list.to_string).to eq 'doop deep'
  end
end

describe 'LinkedList #insert and #prepend' do
  list = LinkedList.new
  it 'should append data to the end of list' do
    list.append('plop')
    expect(list.to_string).to eq 'plop'

    list.append('suu')
    expect(list.to_string).to eq 'plop suu'
  end

  it 'should prepend data to front of list' do
    list.prepend('dop')
    expect(list.to_string).to eq 'dop plop suu'
    expect(list.count).to eq 3
  end

  it 'should insert data anywhere into the list' do
    list.insert(2, 'woo')
    expect(list.to_string).to eq 'dop plop woo suu'
  end

  it 'should handle indexes out of range' do
    list.insert(5, 'pfft')
    expect(list.count).to eq 4
  end
end

describe 'LinkedList #find, #pop, #includes?' do
  list = LinkedList.new
  %w(deep woo shi shu blop).each { |w| list.append(w)}

  it 'should find elements correctly' do
    expect(list.to_string).to eq 'deep woo shi shu blop'
    expect(list.find(2, 1)).to eq 'shi'
    expect(list.find(1, 3)).to eq 'woo shi shu'
  end

  it 'should evaluate data existence' do
    expect(list.includes?('deep')).to be true
    expect(list.includes?('dep')).to be false
  end

  it 'pop elements' do
    expect(list.pop).to eq 'blop'
    expect(list.pop).to eq 'shu'
    expect(list.to_string).to eq 'deep woo shi'
    expect(list.pop).to eq 'shi'
    expect(list.pop).to eq 'woo'
    expect(list.pop).to eq 'deep'
    expect(list.to_string).to eq ''
  end
end

describe '#append refactoring' do
  it 'should be able to append multiple elements in 1 call' do
    list = LinkedList.new
    list.append("deep woo shi shu blop")
    expect(list.count).to eq 5
  end
end
