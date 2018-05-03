module ServerCount
  extend Discordrb::Commands::CommandContainer

  command(%i[servercount servcount], help_available: false, max_args: 0) do |event|
    event.respond "CahBot is on **#{Bot.servers.count}** servers as of now"
  end
end
