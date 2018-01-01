module Restart
  extend Discordrb::Commands::CommandContainer

  command(:restart, help_available: false) do |event|
    if event.user.id == 228_290_433_057_292_288 || event.user.id == 348_607_473_546_035_200
      begin
        event.respond ['Into the ***fuuuutttttuuuuurrrreeee***', 'Please wait...', 'How about n—', 'Can do :thumbsup::skin-tone-1:', 'Pong! Hey, that took... Oh wait, wrong command', 'Ask again at a later ti—'].sample
        exec('bash restart.sh')
      end
    else
      'Sorry, only Cah can update me'
    end
  end
end
