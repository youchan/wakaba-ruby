require 'slack-ruby-bot'
require_relative "fortune.rb"
require_relative "lunch_selection.rb"
require_relative "dice.rb"
require_relative "member_selection.rb"
require_relative "translator.rb"

class KuronekoBot < SlackRubyBot::Bot
  DICE_LIST = [ Fortune.new, LunchSelection.new, Dice.new ]

  def self.possibilities(dice_type, client, data)
    accepted_dice = DICE_LIST.find{|dice| dice.accept?(dice_type) }
    accepted_dice.possibilities(client, data)
  end

  def self.translator
    @translator ||= Translator.new
  end

  match /サイコロ(\s+(?<dice_type>.+))?/ do |client, data, match|
    dice_type = match[:dice_type]
    client.say(text: possibilities(dice_type, client, data).sample, channel: data.channel)
  end

  match /翻訳\s+(?<text>.+)$/ do |client, data, match|
    text = match[:text]
    client.say(text: "`#{text}` を訳すと", channel: data.channel)
    client.say(text: translator.translate(text), channel: data.channel)
  end
end

KuronekoBot.run
