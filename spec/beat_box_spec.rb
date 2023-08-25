require './lib/beat_box'
require './lib/linked_list'
require './lib/node'
require 'rspec'

describe BeatBox do
  bb = BeatBox.new
  it 'should exist' do
    expect(bb).to be_a BeatBox
  end

  it 'should be able to access the list of beats' do
    expect(bb.list).to be_a LinkedList
    expect(bb.list.head).to eq nil
  end
end

describe 'bb functionality' do
  bb = BeatBox.new
  it 'should be able to append a list of beats' do
    bb.append("deep doo ditt")
    expect(bb.list.count).to eq 3
    expect(bb.list.head.data).to eq "deep"
    expect(bb.list.head.next_node.data).to eq "doo"
    bb.append("woo hoo shu")
    expect(bb.list.count).to eq 6
  end
end
