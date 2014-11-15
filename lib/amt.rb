require 'bitset'

class Node
  attr_reader :data

  def initialize(data)
    @data = data
    @bitset = BitSet.new
    @edges = []
  end

  def [](key)
    # lookup in bitset for this key
    # if bitset value is 1
      # count bits till that index
      # use this count as index into the edges array
      # return the edge at this index
    # else return nil
  end

  def has_edge?(key)
    # lookup in bitset for this key
    # if bitset value is 1, return true, else return false
  end
end

class ArrayMappedTrie
end
