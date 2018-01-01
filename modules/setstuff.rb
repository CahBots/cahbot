module SetStuff
  extend Discordrb::Commands::CommandContainer

  command(:set, help_available: false) do |event, action, *args|
    if event.user.id == 228_290_433_057_292_288
      case action
      when 'avatar'
        open(args.join(' ').to_s) { |pic| event.bot.profile.avatar = pic }
      when 'username'
        name = args.join(' ').to_s
        event.respond "Username set to `#{bot.profile.username = name}`"
      when 'game'
        bot.game = args.join(' ').to_s
        event.respond 'GAME SET!'
      when 'status'
        online = bot.on
        idle = bot.idle
        invis = bot.invisible
        dnd = bot.dnd
        args.join!
        'Status Changed!'
      else
        'I don\'t know what to do!'
      end
    else
      'Sorry, only Cah can set stuff'
    end
  end
end
