class Word
  attr_reader :name, :id, :definition

  @@words = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @definition = attributes.fetch(:definition)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def self.clear
    @@words = {}
  end

  def self.find(id)
    @@words[id]
  end

  def save
    @@words[self.id] = Word.new({:name => self.name, :id => self.id, :definition => self.definition})
  end

  def ==(word_to_compare)
    self.name == word_to_compare.name
  end

  def update(name)
    @name = name
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end