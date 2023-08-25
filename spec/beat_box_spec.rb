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

describe 'bb #play' do
  bb = BeatBox.new

  it 'should be able to play the beats' do
    bb.append("deep doo ditt woo hoo shu")
    expect(bb.count).to eq 6
    expect(bb.list.count).to eq 6
    bb.play
  end
end

describe 'bb list should validate beats' do
  bb = BeatBox.new("deep")

  it 'should not add beats not whitelisted' do
    bb.append("Mississippi")
    expect(bb.all).to eq "deep"
    bb.prepend("tee tee tee Mississippi")
    expect(bb.all).to eq "tee tee tee deep"
  end
end
