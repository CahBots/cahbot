module Ping
  extend Discordrb::Commands::CommandContainer

  command(:ping, help_available: false, max_args: 0) do |event|
    m = event.respond('Pinging!')
    m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
  end

  command(:pingnoedit, help_available: false, max_args: 0) do |event|
    event.respond "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
  end
end
