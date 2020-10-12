require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#Definition') do

  before(:each) do
    Definition.clear
    Word.clear
  end

  describe('.all') do
    it('returns an empty array if there are no definitions') do
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a definition to the @@definitions class variable') do
      definition = Definition.new({:body => 'An orange fruit', :word_id => nil, :id => nil})
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('#==') do
    it('checks if two definition objects are equal') do
      def1 = Definition.new({:body => 'An orange fruit', :word_id => 5, :id => 1})
      def1.save()
      def2 = Definition.new({:body => 'An orange fruit', :word_id => 5, :id => 1})
      def2.save()
      expect(def1==def2).to(eq(true))
    end
  end

  describe('.clear') do
    it('removes all definitions in the @@definitions class variable') do
      def1 = Definition.new({:body => 'Apple', :word_id => nil, :id => nil})
      def1.save()
      def2 = Definition.new({:body => 'Orange', :word_id => nil, :id => nil})
      def2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('.find') do
    it('finds a definition by id') do
      def1 = Definition.new({:body => 'Apple', :word_id => nil, :id => nil})
      def1.save()
      def2 = Definition.new({:body => 'Orange', :word_id => nil, :id => nil})
      def2.save()
      expect(Definition.find(def1.id)).to(eq(def1))
    end
  end

  describe('#update') do
    it('updates a definition') do
      word1 = Word.new({ :name => 'Apple', :id => nil, :definition => nil })
      word1.save()
      def1 = Definition.new({:body => 'Apple', :word_id => word1.id, :id => nil})
      def1.save()
      def1.update('Pear', 5)
      expect(def1.body).to(eq('Pear'))
    end
  end

  describe('.find_by_word') do
    it('finds all definitions of a word') do
      word = Word.new({ :name => 'Apple', :id => nil, :definition => nil })
      word.save
      definition = Definition.new({ :body => 'A type of fruit', :word_id => word.id, :id => nil })
      definition.save
      expect(Definition.find_by_word(word.id)).to(eq([definition]))
    end
  end

  describe('#word') do
    it('finds the word which a definition belongs to') do
      word = Word.new({ :name => 'Apple', :id => nil, :definition => nil })
      word.save
      definition = Definition.new({ :body => 'A fruit', :word_id => word.id, :id => nil })
      definition.save
      expect(definition.word).to(eq(word))
    end
  end
end