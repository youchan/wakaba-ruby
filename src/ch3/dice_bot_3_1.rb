require 'slack-ruby-bot'

class DiceBot < SlackRubyBot::Bot
  def self.possibilities(dice_type)
    case dice_type
    when "占い"
      [
        "大吉: 今日一日いいことあるよ！よかったね。",
        "中吉: 今日は何かいいことあるよ！期待していてね。",
        "吉: 今日は何かいいことあるかもよ！何が起こるかな～？",
        "凶: 今日は悪いことがあるかも。気をつけてね！",
        "大凶: 今日は失敗ばかりの一日。明日はいいことあるいいね。"
      ]
    when "ランチ"
      [
        "来々軒のラーメン",
        "シバのカレー",
        "ティーヌンのタイ料理",
        "THE GREAT BURGERのハンバーガー",
      ]
    else
      [
        "サイコロの目は:one:です。",
        "サイコロの目は:two:です。",
        "サイコロの目は:three:です。",
        "サイコロの目は:four:です。",
        "サイコロの目は:five:です。",
        "サイコロの目は:six:です。",
      ]
    end
  end

  match /サイコロ(\s+(?<dice_type>.+))?/ do |client, data, match|
    dice_type = match[:dice_type]
    client.say(text: possibilities(dice_type).sample,
               channel: data.channel)
  end
end

DiceBot.run
