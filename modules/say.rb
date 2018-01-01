module Say
  extend Discordrb::Commands::CommandContainer

  command(:say, help_available: false, required_permissions: [:manage_messages], min_args: 1) do |event, *args|
    event.message.delete
    args.join(' ').to_s
  end
end
