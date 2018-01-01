module Help
  extend Discordrb::Commands::CommandContainer

  command(:help, help_available: false, max_args: 0) do |event|
    event << ' woahdude, you looking for help? Well, here\'s what you need to know.'
    event << ' For a list of commands, you can do `^cmds`, for info about CahBot, do `^info`'
  end
end
