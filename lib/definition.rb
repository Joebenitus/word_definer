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
    self.body == def_to_compare.body
  end

  def update(body)
    @body = body
  end

  def delete
    @@definitions.delete(self.id)
  end
end