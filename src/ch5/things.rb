class Things
  attr_reader :words, :meanings

  def initialize(words)
  @words = words
    @meanings = []
  end

  def learn(meaning)
    @meanings << meaning
  end
end
