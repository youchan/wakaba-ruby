class Dice
  EMOJI = [":one:", ":two:", ":three:", ":four:", ":five:", ":six:"]

  def accept?(dice_type)
    true
  end

  def possibilities
    6.times.map do |i|
      "サイコロの目は#{EMOJI[i]}です。"
    end
  end
end
