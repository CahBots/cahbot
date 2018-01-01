module Reverse
  extend Discordrb::Commands::CommandContainer

  command(%i[reverse rev], help_available: false, min_args: 1) do |_event, *args|
    args.join(' ').to_s.reverse
  end
end
