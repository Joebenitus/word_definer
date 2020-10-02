require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe('#Definition') do
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
end