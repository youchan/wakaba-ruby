class WhatIsReactor
  RE = /^(?<words>.+)ってどういう意味？$/

  def initialize(knowledge)
    @knowledge = knowledge
  end

  def accept?(text, morphemes)
    text.match? RE
  end

  def react(text, morphemes)
    words = RE.match(text)[:words]
    meanings = @knowledge.meanings(words)
    if meanings
      meanings.map{|mean| "`#{words}` は `#{mean}` ということじゃ"}.join("\n")
    else
      "`#{words}` なんて知らん！"
    end
  end
end
