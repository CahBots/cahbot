require 'discordrb'

bot = Discordrb::Bot.new token: 'MjQ5MjY4MzkzODE3OTMxNzc2.CxEv9Q.s8vb2OMalugoBiwAu2g3P21zmqA', client_id: 249268393817931776

bot.message(with_text: "Ping!") do |event|
  event.respond "Pong!"
end

bot.run