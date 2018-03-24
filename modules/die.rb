module Die
  extend Discordrb::Commands::CommandContainer

  command(:die, help_available: false) do |event|
    if event.user.id == 228_290_433_057_292_288
      event.respond 'CahBot is shutting down'
      exit
    else
      "Hey, you can't do that!"
    end
  end
end
