class Definition
  attr_reader :id
  attr_accessor :body, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @body = attributes.fetch(:body)
    @word_id = attributes.fetch(:word_id)
    @id = attributes.fetch(:id) || @@total_rows += 1
  end

  def self.all
    @@definitions.values()
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
end