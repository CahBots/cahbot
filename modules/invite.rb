module Invite
  extend Discordrb::Commands::CommandContainer

  command(:invite, help_available: false, max_args: 0) do |event|
    event.respond 'To invite me to your server, head over here: <https://ruby.cahbot.pro/invite>'
  end
end
