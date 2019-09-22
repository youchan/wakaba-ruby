class LunchSelection
  def dice_type
    "ランチ"
  end

  def accept?(dice_type)
    dice_type == "ランチ"
  end

  def possibilities
    [
      "来々軒のラーメン",
      "シバのカレー",
      "ティーヌンのタイ料理",
      "THE GREAT BURGERのハンバーガー",
    ]
  end
end

