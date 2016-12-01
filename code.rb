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

bot.command(:about, help_available: false) do |event|
  event.respond "Hello, I am Cah Bot, a small Discord bot with loads of potential. To learn more, or to tell me that I suck at bot creation, go here: https://discord.gg/zAbWXfe"
end

bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:invite, chain_usable: false) do |event|
  event.respond "To invite me to your server, head over here: #{event.bot.invite_url}"
end

bot.command(:say, help_available: false, description: "Makes the bot say stupid things!", required_permissions: [:manage_messages]) do |_event, *args|
 event.channel.prune(1)
  event << "#{args.join(' ')}"
end

bot.command(:update, help_available: false) do |event|
  event << ' **Latest CahBot Update**'
  event << ''
  event << 'Oh noes! Development has completely halted for a while. Why? Well, here\'s the thing...'
  event << '**I have no idea what I\'m doing right now** and my bot kinda sucks rn lol'
  event << 'However, CB wil continue to be online (mostly) 24/7, I just need to learn "the ropes" first.'
  event << 'I thank you for your patience'
end

bot.command(:who, help_available: false) do |event|
  event << 'Heyo, I\'m Cah ~~and this is my pawn shop~~ and I\'m the person who made CB.'
  event << ''
  event << 'I\'m 13 years old and my name is Christopher Holland (How\'s it going?).'
  event << 'So you might be wondering why CB is a thing, well, let me tell you.'
  event << ''
  event << '**Once Upon A Time** there was a bored Cah wondering what to do with his time.'
  event << 'He then wondered how hard it is to make a Discord bot. For some reason.'
  event << 'Scavenging the internet he found...**discordrb**. It seemed like a good enough programming language to use.'
  event << 'He then rushes to the Discord API server, the page to create a bot user, etc.'
  event << 'It was at this moment that Cah realized, he had no idea how to code'
  event << 'Through determination and running off of example commands for a short while, he made a fairly basic bot'
  event << 'This bot, was Cah Bot.'
  event << ''
  event << 'But Cah wasn\'t satisfied enough, so he bought an Ubuntu (Through Digital Ocean) for $10 a month, to keep CB alive 24/7.'
  event << 'And after nearly destroying it (thanks Discord API server for trying to destroy me), it worked!'
  event << '***The End***'
end

bot.command(:donate, help_available: false) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: http://bit.ly/2gmWLAx!"
end

bot.command(:help, chain_usable: false) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' ^about: Shows you some info about CB, or something'
  event << ' ^rnumber <Number> <Other Number>: Gives you a random number'
  event << ' ^help: Shows this, obviously'
  event << ' ^ping: Used to show response time'
  event << ' ^invite: Gives you a link to invite me to your own server!'
  event << ' ^die: Shuts me down, only Cah can use this command'
  event << ' ^eval: Like you don\'t know what eval commands do'
  event << ' ^donate: Want to donate? That\'s great! This command gives you a link for PayPal donations'
  event << ' ^update: Gives you the latest CB update'
  event << ' ^who: Gives you a stupid long story of how this came to be'
end

bot.run
