require '../lib/bitset'

describe BitSet do
  it "should validate the given bit index" do
    bitset = BitSet.new
    expect(bitset.valid?(0)).to be_truthy
    expect(bitset.valid?(31)).to be_truthy
    expect(bitset.valid?(32)).to be_falsey
    expect(bitset.valid?("hello")).to be_falsey
  end

  it "should set the given bit position" do
    bitset = BitSet.new
    expect(bitset.set(0).value).to be(0x80000000)
    expect(bitset.set(1).value).to be(0xC0000000)
    expect(bitset.set(31).value).to be(0xC0000001)
  end

  it "should clear the given bit position" do
    bitset = BitSet.new
    expect(bitset.set(0).set(1).set(31).value).to be(0xC0000001)
    expect(bitset.clear(31).value).to be(0xC0000000)
    expect(bitset.clear(1).value).to be(0x80000000)
    expect(bitset.clear(0).value).to be(0)
  end

  it "should get the given bit position" do
    bitset = BitSet.new
    expect(bitset.set(0).set(1).set(31).value).to be(0xC0000001)
    expect(bitset.get(0)).to be(1)
    expect(bitset.get(1)).to be(1)
    expect(bitset.get(31)).to be(1)
    expect(bitset.get(15)).to be(0)
    expect(bitset.get(30)).to be(0)
  end
end
