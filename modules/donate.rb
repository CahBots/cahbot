module Donate
  extend Discordrb::Commands::CommandContainer

  command(:donate, help_available: false, max_args: 0) do |event|
    event.respond "Hi #{event.user.name}, click here for donations: <https://goo.gl/QBvB7N> ~~*not a virus i swear*~~"
  end
end
