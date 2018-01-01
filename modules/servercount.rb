module ServerCount
  extend Discordrb::Commands::CommandContainer

  command(%i[servercount servcount], help_available: false, max_args: 0) do |event|
    event.respond "CahBot is on **#{bot.servers.count}** servers as of now"
  end
end
