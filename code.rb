require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjQ5MjY4MzkzODE3OTMxNzc2.CxPvrg.q-NUnZK5BDt1htnOyV__02XSReg', client_id: 249268393817931776, prefix: '^'

bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:servreg, chain_usable: false, description: "Gets the region the server is stationed in.", permission_level: 1) do
  event.server.region
end

bot.run