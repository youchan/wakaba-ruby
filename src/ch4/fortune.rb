class Fortune
  def dice_type
    "占い"
  end

  def accept?(dice_type)
    dice_type == "占い"
  end

  def possibilities(client, data)
    [
      "大吉: 今日一日いいことあるよ！よかったね。",
      "中吉: 今日は何かいいことあるよ！期待していてね。",
      "吉: 今日は何かいいことあるかもよ！何が起こるかな～？",
      "凶: 今日は悪いことがあるかも。気をつけてね！",
      "大凶: 今日は失敗ばかりの一日。明日はいいことあるいいね。"
    ]
  end
end

