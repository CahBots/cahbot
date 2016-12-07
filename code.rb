require 'discordrb'
require 'configatron'
require_relative 'config.rb'

bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 249268393817931776, prefix: '^'

bot.command(:die, help_available: false) do |event|
  if event.user.id == 228290433057292288
    bot.send_message(event.channel.id, 'CahBot is shutting down')
    exit
  else
    "Hey, you can't do that!"
  end
end

bot.command(:eval, help_available: false) do |event, *code|
  if event.user.id == 228290433057292288
    begin
      eval code.join(' ')
    rescue
      'Do you even code. m8?'
    end
  else
     "Hey, you're not Cah!"
  end
end

bot.command :ping do |event|
  m = event.respond('Pong!')
  m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command(:roll, description: 'Does something like rolling a dice!') do |event|
      h = event.respond '**Rolling Dice!**'
      h.edit "And you got a... **#{rand(1..6)}!**"
end

bot.command(:flip, help_available: false) do
  %w(**Heads!** **Tails!**).sample
end

bot.command(:about, help_available: false) do |event|
  event << '***About Cah Bot:***'
  event << ''
  event << '**Who made CB?** Cah#5153 made CahBot'
  event << '**What lib is CB made in?** discordrb'
  event << '**Where is the CB Server?** Here: https://goo.gl/02ZRK5'
  event << '**u suk.** Thanks, feel free to stop by the CB Server to tell me why.'
end

bot.message(with_text: 'CB prefix') do |event|
  event.respond "My prefix is `^`. To see all commands, use `^help`"
end

bot.command(:avatar, usage: 'avatar <url>', min_args: 1, help_available: false) do |event, url|
  break unless event.author.id == 228290433057292288 && valid_url?(url)

  event.bot.profile.avatar = open(url)
  'Heyo, CB\'s avatar was changed'
end

bot.command(:name, usage: 'name <name>', min_args: 1, help_available: false) do |event, url|
  break unless event.author.id == 228290433057292288

  event.bot.profile.username = "CahBot"
  'Heyo, CB\'s name was changed (Maybe he\'s not CB anymore lol)'
end

bot.command :rnumber do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:invite, chain_usable: false) do |event|
  event.respond "To invite me to your server, head over here: https://goo.gl/ttNED9"
end

bot.command(:say, help_available: false, required_permissions: [:manage_messages]) do |_event, *args|
  _event.message.delete
  "#{args.join(' ')}"
end

bot.command(:update, help_available: false) do |event|
  event << ' **Latest CahBot Update**'
  event << ''
  event << 'Hey hey heyo, CB is secure, now no one can steal my token, woot.'
  event << 'Anyways, not much was done recently, with me panicking about my bot token or whatever.'
  event << 'I\'ve rewritten the about command, for some reason.'
  event << 'Minor changes to random code.'
  event << 'Soooo close to ten servers.'
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
  event << ' ^flip: flips a coin, what else did you expect?'
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
