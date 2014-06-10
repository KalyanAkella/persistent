# An implementation of a 32-bit BitSet
class BitSet
  attr_reader :value

  def initialize
    @value = 0
  end

  def set(bit_index)
    raise "bit_index must be in the interval [0,31]. Given #{bit_index}." unless valid?(bit_index)
    @value |= (0x80000000 >> bit_index)
    return self
  end

  def clear(bit_index)
    raise "bit_index must be in the interval [0,31]. Given #{bit_index}." unless valid?(bit_index)
    @value &= 0xFFFFFFFF ^ (0x80000000 >> bit_index)
    return self
  end

  def get(bit_index)
    raise "bit_index must be in the interval [0,31]. Given #{bit_index}." unless valid?(bit_index)
    mask = @value & (0x80000000 >> bit_index)
    mask >> (31 - bit_index)
  end

  def cardinality
    result = 0
    temp = @value
    32.times do
      result += (temp & 1)
      temp >>= 1
    end
    return result
  end

  def valid?(bit_index)
    bit_index.is_a?(Integer) and bit_index.between?(0, 31)
  end
end
