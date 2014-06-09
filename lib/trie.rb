# An implmentation of the Trie data structure

class Node
  attr_accessor :data, :edges

  def initialize(data)
    @data = data
    @edges = {}
  end

  def [](key)
    @edges[key]
  end

  def []=(key, value)
    @edges[key] = value
  end

  def has_edge?(key)
    @edges.has_key?(key)
  end

  def no_edges?
    @edges.empty?
  end
end

class Trie
  def initialize
    @root = Node.new("*")
  end

  def insert(data)
    curr_node = @root
    chars = data.chars; index = 0
    while index < chars.length and curr_node.has_edge?(chars[index])
      curr_node = curr_node[chars[index]]
      index += 1
    end
    return false if index == chars.length   # node already present in trie
    while index < chars.length
      curr_node[chars[index]] = Node.new(data[0..index])
      curr_node = curr_node[chars[index]]
      index += 1
    end
    return true
  end

  def search(data)
    curr_node = @root
    chars = data.chars; index = 0
    while index < chars.length and curr_node.has_edge?(chars[index])
      curr_node = curr_node[chars[index]]
      index += 1
    end
    result = []
    if index == chars.length
      stack = [curr_node]
      until stack.empty?
        node = stack.pop
        if node.no_edges?
          result << node.data
        else
          node.edges.each_value { |_node_| stack.push(_node_) }
        end
      end
    end
    result
  end

  def printf
    stack = []
    stack.push(@root)
    until stack.empty?
      node = stack.pop
      print node.data + "->"
      node.edges.each_pair do |key, edge_node|
        print key + ", "
        stack.push(edge_node)
      end
      puts nil
    end
  end
end
