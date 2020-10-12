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
    @@definitions = {}
  end

  def self.find(id)
    @@definitions[id]
  end

  def save
    @@definitions[self.id] = Definition.new({:body => self.body, :word_id => self.word_id, :id => self.id})
  end

  def ==(def_to_compare)
    (self.body == def_to_compare.body) && (self.word_id == def_to_compare.word_id)
  end

  def update(body, word_id)
    self.body = body
    self.word_id = word_id
    @@definitions[self.id] = Definition.new({ body: self.body, word_id: self.word_id, id: self.id })
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(word_id)
    definitions = []
    @@definitions.values.each do |definition|
      if definition.word_id == word_id
        definitions.push(definition)
      end
    end
    definitions
  end

  def word
    Word.find(self.word_id)
  end
end