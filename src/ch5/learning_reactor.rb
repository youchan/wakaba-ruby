class LearningReactor
  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text, morphemes)
    morphemes.find{|n| n.surface == "は" && n.feature == "助詞"}
  end

  def react(text, morphemes)
    index = morphemes.find_index{|n| n.surface == "は" && n.feature == "助詞"}
    words = morphemes[0...index].map(&:surface).join
    meaning = morphemes[index + 1..].map(&:surface).join
    @knowledge.learn(words, meaning)
    "`#{words}` を `#{meaning}` という意味で覚えたのじゃ"
  end
end

