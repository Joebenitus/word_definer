require 'rspec'
require 'word'

describe('#Word') do
  describe('.all') do
    it('returns an empty array if there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('.save') do
    it('saves words by adding them to the @@words class variable') do
      word = Word.new({:name => 'Apple', :id => nil})
      word.save()
      expect(Word.all).to(eq([word]))
    end
  end
end