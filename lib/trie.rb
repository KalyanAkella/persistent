# An implmentation of the Trie data structure

# Allows only lower case alphabets. Uses a sparse array to represent edges at every node.
class Node
  attr_accessor :data, :edges

  def initialize(data)
    @data = data
    @edges = Array.new(26)  # a-z -> 26 positions
  end

  def [](key)
    @edges[index_of(key)]
  end

  def []=(key, value)
    @edges[index_of(key)] = value
  end

  def has_edge?(key)
    !@edges[index_of(key)].nil?
  end

  def no_edges?
    @edges.all?(&:nil?)
  end

  def index_of(key)
    key.ord - 'a'.ord
  end
end

class Trie
  def initialize
    @root = Node.new("*")
  end

  def valid_data?(data)
    data =~ /^[a-z]+$/
  end

  def insert(data)
    raise "Unsupported data format: #{data}. Only lower case alphabets allowed." unless valid_data?(data)
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
          node.edges.reject(&:nil?).each { |_node_| stack.push(_node_) }
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
      node.edges.each_index do |index|
        print ("%c" % ('a'.ord + index)) + ", "
        stack.push(edge[index])
      end
      puts nil
    end
  end
end
