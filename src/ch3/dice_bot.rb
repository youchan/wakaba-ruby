require 'slack-ruby-bot'
require_relative "fortune.rb"
require_relative "lunch_selection.rb"
require_relative "dice.rb"

class DiceBot < SlackRubyBot::Bot
  DICE_LIST = [ Fortune.new, LunchSelection.new, Dice.new ]

  def self.possibilities(dice_type)
    accepted_dice = DICE_LIST.find{|dice| dice.accept?(dice_type) }
    accepted_dice.possibilities
  end

  match /サイコロ(\s+(?<dice_type>.+))?/ do |client, data, match|
    dice_type = match[:dice_type]
    client.say(text: possibilities(dice_type).sample, channel: data.channel)
  end
end

DiceBot.run
