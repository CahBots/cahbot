require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjQ5MjY4MzkzODE3OTMxNzc2.CxPvrg.q-NUnZK5BDt1htnOyV__02XSReg', client_id: 249268393817931776, prefix: '^'

bot.command(:shutdown, help_available: false) do |event|
  break unless event.user.id == 228290433057292288

  bot.send_message(event.channel.id, 'Cah has turned off Cah Bot')
  exit
end


bot.command :ping do |event|
  m = event.respond('Pong!')
  m.edit "Pong! Time taken: #{Time.now - event.timestamp} seconds."
end


bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:servreg, chain_usable: false, description: "Gets the region the server is stationed in.") do
  event.server.region
end

bot.run