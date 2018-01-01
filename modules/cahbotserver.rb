module CahBotServer
  extend Discordrb::Commands::CommandContainer

  command(%i[subscribe sub]) do |event|
    if event.channel.pm? == true
      event.respond 'I can not give you a role in PMs! That would be silly (and impossible)!'
      break
    end
    to_add = event.server.roles.find { |role| role.name == 'Sub' }
    if event.server.id == 252_196_054_101_917_696
      if event.user.role?(to_add) == false
        event.user.add_role(to_add)
        event.message.delete
        m = event.respond 'Nice, subscribed successfully!'
        bot.channel(252_260_490_028_384_258).send_embed do |e|
          e.title = '**New Subscriber**'
          e.color = 555_555
          e.timestamp = Time.now
          e.footer = { icon_url: event.author.avatar_url.to_s, text: "#{event.author.name}##{event.author.discriminator}" }
        end
        sleep 3
        m.delete
      else
        event.message.delete
        e = event.respond 'You already have the role!'
        sleep 3
        e.delete
      end
    else
      event.respond 'This command can only be used in the CB Server'
    end
  end

  command(%i[unsubscribe unsub]) do |event|
    if event.channel.pm? == true
      event.respond 'I can not take a role in PMs! That would be silly (and impossible)!'
      break
    end
    to_add = event.server.roles.find { |role| role.name == 'Sub' }
    if event.server.id == 252_196_054_101_917_696
      if event.user.role?(to_add) == true
        event.user.remove_role(to_add)
        event.message.delete
        m = event.respond "You've unsubscribed from updates!"
        bot.send_message(252_260_490_028_384_258, "#{event.user.name}\##{event.user.discrim} is no longer a subscriber!")
        sleep 3
        m.delete
      else
        event.message.delete
        e = event.respond "You don't have the role!"
        e.delete
      end
    else
      event.respond 'This command can only be used in the CB Server'
    end
  end

  command(:accept, in: '<#269981476135632896>') do |event|
    if event.server.id == 252_196_054_101_917_696
      if event.channel.id == 269_981_476_135_632_896
        event.message.delete
        to_add = event.server.roles.find { |role| role.name == 'Members' }
        if event.user.role?(to_add) == false
          event.user.add_role(to_add)
          event.user.pm('Thank you for reading the rules and information, enjoy your stay!')
        else
          event.respond 'You must already have the member role, or an error has occured. Please notify cah or chew.'
        end
      else
        break
      end
    else
      event.respond 'This command can only be used in the CB Server'
    end
  end
end
