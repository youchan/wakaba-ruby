require 'slack-ruby-bot'
require_relative "fortune.rb"
require_relative "lunch_selection.rb"
require_relative "dice.rb"

class DiceBot < SlackRubyBot::Bot
  def self.possibilities(dice_type)
    hash = {}
    fortune = Fortune.new
    hash[fortune.dice_type] = fortune.possibilities
    lunch = LunchSelection.new
    hash[lunch.dice_type] = lunch.possibilities
    dice = Dice.new
    hash[dice_type] || dice.possibilities
  end

  match /サイコロ(\s+(?<dice_type>.+))?/ do |client, data, match|
    dice_type = match[:dice_type]
    client.say(text: possibilities(dice_type).sample, channel: data.channel)
  end
end

DiceBot.run
