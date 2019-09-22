class MemberSelection
  def accept?(dice_type)
    dice_type == "メンバー"
  end

  def possibilities(client, data)
    channel_info = client.web_client.channels_info(channel: data.channel)
    users_info = channel_info.dig("channel","members").map do |uid|
      client.web_client.users_info(user: uid)
    end

    users_info.reject{|user_info|
      user_info.dig("user", "is_bot")
    }.map{|user_info|
      "@" + user_info.dig("user", "real_name")
    }
  end
end

