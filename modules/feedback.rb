module Feedback
  extend Discordrb::Commands::CommandContainer

  command(:feedback, min_args: 1) do |event, *args|
    begin
      event.message.delete
    rescue Discordrb::Errors::NoPermission
      puts 'Unable to delete feedback message, failing silently.'
    end
    feedback = args.join(' ')
    Bot.channel(252_239_053_712_392_192).send_embed do |embed|
      embed.title = 'New Feedback!'
      embed.colour = '6166A8'
      embed.description = feedback.to_s
      embed.timestamp = Time.now

      begin
        RestClient.get("https://cdn.discordapp.com/avatars/#{event.user.id}/#{event.user.avatar_id}.gif?size=1024")
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: event.user.distinct.to_s, icon_url: "https://cdn.discordapp.com/avatars/#{event.user.id}/#{event.user.avatar_id}.gif?size=1024")
      rescue RestClient::UnsupportedMediaType
        embed.author = Discordrb::Webhooks::EmbedAuthor.new(name: event.user.distinct.to_s, icon_url: "https://cdn.discordapp.com/avatars/#{event.user.id}/#{event.user.avatar_id}.webp?size=1024")
      end

      embed.add_field(name: 'User ID', value: event.user.id.to_s, inline: true)
      if event.channel.pm?
        embed.add_field(name: 'Server', value: 'Sent from a DM', inline: true)
      else
        embed.add_field(name: 'Server', value: "Name: #{event.server.name}\n#{event.server.id}", inline: true)
      end
    end
    # Old, normie oneliner that isn't an embed, kept just in case we need to finna revert.
    # Bot.send_message(252_239_053_712_392_192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From the land of `#{event.server.name}` (Server ID: #{event.server.id}).\n\n*#{args.join(' ')}*")
    event.send_temporary_message('Radical! Feedback sent.', 5)
  end
end
