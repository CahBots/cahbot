module EBall
  extend Discordrb::Commands::CommandContainer

  command(%i[eightball eball 8ball], help_available: false, min_args: 1) do |event|
    event.respond ['Sources say... Yeah', 'Sources say... Nah', 'Perhaps', 'As I see it, yes', 'As I see it, no', 'If anything, probably', 'Not possible', 'Ask again at a later time', 'Say that again?', 'lol idk', 'Probably not', 'woahdude', '[object Object]', 'Undoubtfully so', 'I doubt it', 'Eh, maybe'].sample
  end
end
