require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjQ5MjY4MzkzODE3OTMxNzc2.CxPvrg.q-NUnZK5BDt1htnOyV__02XSReg',  client_id: 249268393817931776, prefix: '^'

bot.command(:die, help_available: false) do |event|
  break unless event.user.id == 228290433057292288

  bot.send_message(event.channel.id, 'Cah Bot is shutting down')
  exit
end

bot.command(:eval, help_available: false) do |event, *code|
  break unless event.user.id == 228290433057292288

  begin
    eval code.join(' ')
  rescue
    'An error occurred when doing that, Bloop'
  end
end

bot.command :ping do |event|
  m = event.respond('Pong!')
  m.edit "Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command(:roll, description: 'Does something like rolling a dice!') do |event|
      h = event.respond '**Rolling Dice!**'
      h.edit "And you got a... **#{rand(1..6)}!**"
end

bot.command(:about, help_available: false) do |event|
  event << '***About Cah Bot:***'
  event << 'Heyo, this is Cah Bot, "A small Discord bot with loads of potential"'
  event << '**Who made CB?** Cah did (If you couldn\'t really tell).'
  event << '**Where do I go to complain about CB?** Here: https://discord.gg/cWmvfmz .'
  event << '**What lib do you use?** discordrb'
  event << '**How\'s it going?** Good'
end

bot.message(with_text: 'CB prefix') do |event|
  event.respond "My prefix is `^`. To see all commands, use `^help`"
end

bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:invite, chain_usable: false) do |event|
  event.respond "To invite me to your server, head over here: #{event.bot.invite_url}"
end

bot.command(:say, help_available: false, required_permissions: [:manage_messages]) do |_event, *args|
  "#{args.join(' ')}"
end

bot.command(:update, help_available: false) do |event|
  event << ' **Latest CahBot Update**'
  event << ''
  event << 'Okay, I\'m on a half-break right now, but...'
  event << 'Added ^roll.'
  event << 'Added a bot mention event, shows you the prefix'
  event << 'Eyy, we have a new """staff""" member, say hello to him!'
end

bot.command(:donate, help_available: false) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: http://bit.ly/2gmWLAx!"
end

bot.command(:help, chain_usable: false) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' (upon saying "CB prefix") reminds you the prefix'
  event << ' ^about: Shows you some info about CB, or something'
  event << ' ^rnumber <Number> <Other Number>: Gives you a random number'
  event << ' ^help: Shows this, obviously'
  event << ' ^ping: Used to show response time'
  event << ' ^invite: Gives you a link to invite me to your own server!'
  event << ' ^die: Shuts me down, only Cah can use this command'
  event << ' ^roll: Rolls a number between 1 and 6'
  event << ' ^eval: Like you don\'t know what eval commands do'
  event << ' ^donate: Want to donate? That\'s great! This command gives you a link for PayPal donations'
  event << ' ^update: Gives you the latest CB update'
  event << ' ^say: Makes CB say something, you need the manage messages perm tho'
end

bot.run
