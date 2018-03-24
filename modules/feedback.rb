module Feedback
  extend Discordrb::Commands::CommandContainer

  command(:feedback, min_args: 1) do |event, *args|
    if event.channel.pm? == true
      event.respond "Sorry, you can't send feedback via PM just yet!"
      break
    else
      begin
        event.message.delete
      rescue Discordrb::Errors::NoPermission
        puts 'Unable to delete feedback message, failing silently.'
      end
      Bot.send_message(252_239_053_712_392_192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From the land of `#{event.server.name}` (Server ID: #{event.server.id}).\n\n*#{args.join(' ')}*")
      event.send_temporary_message('Radical! Feedback sent.', 5)
    end
  end
end
