module Feedback
  extend Discordrb::Commands::CommandContainer

  command(:feedback, min_args: 1) do |event, *args|
    if event.channel.pm? == true
      event.respond "Sorry, you can't send feedback via PM just yet!"
      break
    else
      event.message.delete
      bot.send_message(252_239_053_712_392_192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From the land of `#{event.server.name}` (Server ID: #{event.server.id}).

  *#{args.join(' ')}*")
      m = (event.respond 'Radical! Feedback sent.')
      sleep 5
      m.delete
    end
  end
end
