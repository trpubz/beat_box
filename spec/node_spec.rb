require_relative '../lib/node'
require 'rspec'
require 'byebug'

describe Node do
  before :each do
    @node = Node.new('plop')
  end

  it 'is an instance of Node' do
    expect(@node).to be_a Node
  end
  it 'should contain data' do
    expect(@node.data).to eq 'plop'
  end
  it 'should contain a next_node' do
    expect(@node.next_node).to be_nil
  end
end
