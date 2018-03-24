module Leave
  extend Discordrb::Commands::CommandContainer

  command :leave do |event, id|
    if event.user.id == 228_290_433_057_292_288
      Bot.server(id.to_i).leave
    else
      'aaaaa'
    end
  end
end
