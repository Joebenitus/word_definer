require 'rspec'
require 'word'

describe('#Word') do

  before(:each) do
    Word.clear()
    word_test = Word.new({:name => 'Apple', :id => nil, :definition => nil})
  end

  describe('.all') do
    it('returns an empty array if there are no words') do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves words by adding them to the @@words class variable') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      expect(Word.all).to(eq([word]))
    end
  end

  describe('#==') do
    it('checks if two word objects are equal') do
      word1 = Word.new({:name => 'Ball', :id => 2, :definition => nil})
      word1.save()
      word2 = Word.new({:name => 'Ball', :id => 2, :definition => nil})
      word2.save()
      expect(word1==word2).to(eq(true))
    end
  end

  describe('.clear') do
    it('removes all words in the @@words class variable') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a word by id') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      expect(Word.find(word.id)).to(eq(word))
    end
  end

  describe('#update') do
    it('updates a word') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      word.update('Pear')
      expect(word.name).to(eq('Pear'))
    end
  end

  describe('#definitions') do
    it('lists all the definitions of a word') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      definition = Definition.new({ :body => 'A type of fruit', :word_id => word.id, :id => nil })
      definition.save()
      expect(word.definitions).to(eq([definition]))
    end
  end

  describe('#delete') do
    it('deletes a definition') do
      word = Word.new({:name => 'Apple', :id => nil, :definition => nil})
      word.save()
      definition = Definition.new({ :body => 'A type of fruit', :word_id => word.id, :id => nil })
      definition.save()
      definition.delete
      expect(word.definitions).to(eq([]))
    end
  end
end