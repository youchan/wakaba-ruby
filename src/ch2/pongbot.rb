require 'slack-ruby-bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'サイコロ' do |client, data, match|
    client.say(text: rand(1..6), channel: data.channel)
  end

  command '占い' do |client, data, match|
    possibilities = [
      "大吉: 今日一日いいことあるよ！よかったね。",
      "中吉: 今日は何かいいことあるよ！期待していてね。",
      "吉: 今日は何かいいことあるかもよ！何が起こるかな～？",
      "凶: 今日は悪いことがあるかも。気をつけてね！",
      "大凶: 今日は失敗ばかりの一日。明日はいいことあるいいね。"
    ]
    client.say(text: possibilities[rand(6)], channel: data.channel)
  end
end

PongBot.run
