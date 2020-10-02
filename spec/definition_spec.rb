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
end