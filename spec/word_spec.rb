require 'rspec'
require 'word'

describe('#Word') do
  describe('.all') do
    it('returns an empty array if there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves words by adding them to the @@words class variable') do
      word = Word.new({:name => 'Apple', :id => nil})
      word.save()
      expect(Word.all).to(eq([word]))
    end
  end

  describe('#==') do
    it('checks if two word objects are equal') do
      word1 = Word.new({:name => 'Ball', :id => 2})
      word1.save()
      word2 = Word.new({:name => 'Ball', :id => 2})
      word2.save()
      expect(word1==word2).to(eq(true))
    end
  end
end