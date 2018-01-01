module Roll
  extend Discordrb::Commands::CommandContainer

  command(:roll, help_available: false, max_args: 0) do |event|
    h = event.respond '**Rolling Dice!**'
    sleep 2
    h.edit "And you got a... **#{rand(1..6)}!**"
  end
end
