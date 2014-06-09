require '../lib/trie'

describe Trie do
  it "should insert elements in the trie" do
    trie = Trie.new
    expect(trie.insert("abc")).to be_truthy
    expect(trie.insert("def")).to be_truthy
    expect(trie.insert("a")).to be_falsey
    expect(trie.insert("ab")).to be_falsey
    expect(trie.insert("de")).to be_falsey
  end
  
  it "should search elements in the trie" do
    trie = Trie.new
    expect(trie.insert("abc")).to be_truthy
    expect(trie.insert("aabb")).to be_truthy
    expect(trie.insert("aabc")).to be_truthy
    expect(trie.insert("abbc")).to be_truthy
    expect(trie.insert("ac")).to be_truthy
    
    expect(trie.search("ab")).to contain_exactly("abc", "abbc")
    expect(trie.search("a")).to contain_exactly("abc", "abbc", "aabb", "ac", "aabc")
    expect(trie.search("b")).to be_empty
    expect(trie.search("abc")).to contain_exactly("abc")
    expect(trie.search("aab")).to contain_exactly("aabc", "aabb")
  end
end
