require "natto"
require_relative "knowledge"
require_relative "learning_reactor"
require_relative "what_is_reactor"

class Kuronekosan
  REACTOR_CLASSES = [LearningReactor, WhatIsReactor]

  def initialize
    @knowledge = Knowledge.new
    @natto = Natto::MeCab.new("-F%f[0]")
    @reactors = REACTOR_CLASSES.map do |rc|
      rc.new(@knowledge)
    end
  end

  def react(text)
    morphemes = @natto.enum_parse(text).reject{|n| n.is_eos?}
    reactor = @reactors.find{|reactor| reactor.accept?(text, morphemes) }
    if reactor
      reactor.react(text, morphemes)
    else
      "おぬしは何を言っているのじゃ？"
    end
  end
end

