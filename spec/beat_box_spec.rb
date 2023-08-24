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
