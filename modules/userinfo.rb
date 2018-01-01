module UserInfo
  extend Discordrb::Commands::CommandContainer

  command(%i[uinfo userinfo user me], help_available: false, max_args: 0) do |event|
    event << '**__User Info For You__**'
    event << ''
    event << "**User ID:** `#{event.user.id}`"
    event << "**User Discrim:** `#{event.user.discrim}`"
    event << "**Username:** `#{event.user.name}`"
    event << "**User Nickname:** `#{event.user.nick}`" unless event.user.nick.nil?
    event << "**User Game:** `#{event.user.game}`" unless event.user.game.nil?
    event << "**User Avatar:** https://cdn.discordapp.com/avatars/#{event.user.id}/#{event.user.avatar_id}.webp?size=1024"
  end
end
