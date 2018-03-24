module SetStuff
  extend Discordrb::Commands::CommandContainer

  command(:set, help_available: false) do |event, action, *args|
    if event.user.id == 228_290_433_057_292_288
      case action
      when 'avatar'
        open(args.join(' ').to_s) { |pic| event.bot.profile.avatar = pic }
      when 'username'
        name = args.join(' ').to_s
        event.respond "Username set to `#{Bot.profile.username = name}`"
      when 'game'
        Bot.game = args.join(' ').to_s
        event.respond 'GAME SET!'
      when 'status'
        online = Bot.on
        idle = Bot.idle
        invis = Bot.invisible
        dnd = Bot.dnd
        args.join(' ')!
        'Status Changed!'
      else
        'I don\'t know what to do!'
      end
    else
      'Sorry, only Cah can set stuff'
    end
  end
end
