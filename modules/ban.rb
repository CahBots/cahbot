module Ban
  extend Discordrb::Commands::CommandContainer

  command(:ban, help_available: false, required_permissions: [:ban_members], permission_message: 'Heh, sorry, but you need the Ban Members permission to use this command', max_args: 1, min_args: 1, usage: '^ban <mention>') do |event, *args|
    bot_profile = bot.profile.on(event.server)
    can_do_the_magic_dance = bot_profile.permission?(:ban_members)
    if can_do_the_magic_dance == true
      if !event.message.mentions.empty?
        begin
          mention = bot.parse_mention(args.join.to_s).id
          event.server.ban(mention.to_s, message_days = 7)
          event.respond ["<@#{mention}> has been beaned, the past 7 days of messages from them have been deleted", "<@#{mention}> has been banned, the past 7 days of messages from them have been deleted"]
        rescue => e
          event.respond 'The user you are trying to ban has a role higher than/equal to me. If you believe this is a mistake, report this to the CB Server'
          bot.send_message(281_280_895_577_489_409, "ERROR on server #{event.server.name} (ID: #{event.server.id}) for command `^ban`, `#{e}`")
        else
          event.respond 'Sorry, but I do not have the "Ban Members" permission'
        end
      else
        event.respond 'Sorry, but you need to mention the person you want to ban'
      end
    end
  end
end
