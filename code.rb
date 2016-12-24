require 'discordrb'
require 'configatron'
require_relative 'config.rb'

bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 249268393817931776, prefix: '^'

bot.ready do |event|
  bot.game="Use ^cmds or ^info"
end

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
     "Yo, you aren't allowed to do that!"
  end
end

bot.command(:ping, help_available: false, max_args: 0) do |event|
  m = event.respond('Pong!')
  m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command(:eightball, help_available: false, min_args: 1) do |event|
  event.respond ["Sources say... Yeah", "Sources say... Nah", "Perhaps", "As I see it, yes", "As I see it, no", "If anything, probably", "Not possible", "Ask again at a later time", "Say that again?", "lol idk", "Probably not", "woahdude", "[object Object]", "Undoubtfully so", "I doubt it", "Eh, maybe"].sample
end

bot.command(:roll, help_available: false, max_args: 0) do |event|
      h = event.respond '**Rolling Dice!**'
      h.edit "And you got a... **#{rand(1..6)}!**"
end

bot.command(:flip, help_available: false, max_args: 0) do |event|
  m = event.respond ["woahdude, you got **Heads**", "woahdude, you got **Tails**", "Oops, the coin flipped so high it didn't come back down", "The coin multiplied and landed on both", "The coin... disappeared", "You got **heads**", "You got **tails**", "The coin landed on it's side then tipped over to **heads**", "The coin landed on it's side then tipped over to **tails**", "And you got a... **#{rand(1..6)}!** wait what", "The coin landed on **heads** but bounced over to **tails**", "The coin landed on **tails** but bounced over to **heads**", "What coin?", "Perhaps you could resolve your situation without relying on luck", "Pong! It took **#{((Time.now - event.timestamp) * 1000).to_i}**ms to ping the coin"].sample
end

bot.command(:info, help_available: false, max_args: 0) do |event|
  event << '***Info About CahBot:***'
  event << ''
  event << '**Who made CB?** Cah#5153 made CahBot'
  event << '**What lib is CB made in?** discordrb'
  event << '**Where is the CB Server?** Here: https://goo.gl/02ZRK5'
  event << '**u suk.** Thanks, feel free to stop by the CB Server to tell me why.'
end

bot.message(with_text: 'CB prefix') do |event|
  event.respond "My prefix is `^`. For help, do `^help`"
end

bot.command(:rnumber, help_available: false, min_args: 2, max_args: 2) do |event, min, max|
  rand(min.to_i .. max.to_i)
end

bot.command(:invite, help_available: false, max_args: 0) do |event|
  event.respond "To invite me to your server, head over here: https://goo.gl/ttNED9"
end

bot.command(:say, help_available: false, required_permissions: [:manage_messages], min_args: 1) do |_event, *args|
  _event.message.delete
  "#{args.join(' ')}"
end

bot.command(:reverse, help_available: false, min_args: 1) do |event, *args|
  "#{args.join(' ')}".reverse
end

bot.command(:userinfo, help_available: false, max_args: 0) do |event|
  event << "**__User Info For You__**"
  event << ""
  event << "**User ID:** `#{event.user.id}`"
  event << "**User Discrim:** `#{event.user.discrim}`"
  event << "**Username:** `#{event.user.name}`"
  event << "**Are You A Bot?** `#{event.user.current_bot?}`"
  event << "**User Nickname?** `#{event.user.nick}`"
  event << "**User Avatar:** https://discordapp.com/api/v6/users/#{event.user.id}/avatars/#{event.user.avatar_id}.jpg"
end

bot.command(:update, help_available: false, max_args: 0) do |event|
  event << '**Latest CahBot Update**'
  event << ''
  event << 'woahdude, we have a userinfo command and a bunch of other stuff, pretty basic rn but still neat'
  event << 'We both gained and lost ~~the same~~ "staff" member, so yay???'
  evnet << '^help and ^cmds are seperate commands now, so don\'t panick or anything please'
end

bot.command(:donate, help_available: false, max_args: 0) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: https://goo.gl/kF20Xw ~~not a virus i swear~~"
end

bot.command(:help, help_available: false, max_args: 0) do |event|
  event << ' woahdude, you looking for help? Well, here\'s what you need to know.'
  event << ' For a list of commands, you can do `^cmds`, for info about CahBot, do `^info`'
end

bot.command(:cmds, chain_usable: false, max_args: 0) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' (upon saying "CB prefix") reminds you the prefix'
  event << ' ^info: Shows you some info about CB, or something'
  event << ' ^rnumber <Number> <Other Number>: Gives you a random number'
  event << ' ^help: Basically tells you to go here'
  event << ' ^cmds: pulls up this'
  event << ' ^eightball: Ask the 8ball something'
  event << ' ^userinfo: Shows some info about you'
  event << ' ^reverse: Reverses text'
  event << ' ^flip: Flips a coin, what else did you expect?'
  event << ' ^ping: Used to show response time'
  event << ' ^invite: Gives you a link to invite me to your own server!'
  event << ' ^die: Shuts me down, only Cah can use this command'
  event << ' ^roll: Rolls a number between 1 and 6'
  event << ' ^eval: Like you don\'t know what eval commands do'
  event << ' ^donate: Want to donate? That\'s great! This command gives you a link for Donorbox donations'
  event << ' ^update: Gives you the latest CB update'
  event << ' ^say: Makes CB say something, you need the manage messages perm tho'
end

bot.run
