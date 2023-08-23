require './lib/linked_list'
require './lib/node'

describe Linked_List do
  list = Linked_List.new
  p list
  it 'should be a Linked_List' do
    expect(list).to be_a Linked_List
  end

  it 'should have a head' do
    expect(list.head).to be_nil
  end

  it 'should append a node' do
    list.append('doop')
    p list
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
    p list
    expect(list.head.next_node).to be_a Node
  end

  it 'should be able to count itself' do
    expect(list.count).to eq 2
  end

  it 'should be able to convert it\'s nodes data to a string' do
    expect(list.to_string).to eq 'doop deep'
  end
end
