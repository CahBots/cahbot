module Noot
  extend Discordrb::Commands::CommandContainer

  command(:noot, help_available: false, max_args: 0) do |event|
    event.respond '**NOOT** http://cahbot.pro/noot.gif'
  end
end
