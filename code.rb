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
    rescue => e
      event << "Ah geez, something went wrong, it says:"
      event << "```"
      event << "#{e} ```"
    end
  else
     "Yo, you aren't allowed to do that!"
  end
end

bot.command(:ping, help_available: false, max_args: 0) do |event|
  m = event.respond('Pinging!')
  m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command([:eightball, :eball], help_available: false, min_args: 1) do |event|
  event.respond ["Sources say... Yeah", "Sources say... Nah", "Perhaps", "As I see it, yes", "As I see it, no", "If anything, probably", "Not possible", "Ask again at a later time", "Say that again?", "lol idk", "Probably not", "woahdude", "[object Object]", "Undoubtfully so", "I doubt it", "Eh, maybe"].sample
end

bot.command(:roll, help_available: false, max_args: 0) do |event|
      h = event.respond '**Rolling Dice!**'
  sleep 2
      h.edit "And you got a... **#{rand(1..6)}!**"
end

bot.command(:flip, help_available: false, max_args: 0) do |event|
  m = event.respond ["woahdude, you got **Heads**", "woahdude, you got **Tails**", "You got **heads**", "You got **tails**"].sample
end

bot.command(:flop, help_available: false, max_args: 0) do |event|
  m = event.respond ["Oops, the coin flipped so high it didn't come back down", "The coin multiplied and landed on both", "The coin... disappeared", "Pong! It took **#{((Time.now - event.timestamp) * 1000).to_i}ms** to ping the coin", "And you got a... **#{rand(1..6)}!** wait thats not how coins work", "Perhaps you could resolve your situation without relying on luck", "noot", "[Witty joke concerning flipping a coin]", "[BOTTOM TEXT]"].sample
end

bot.command(:info, help_available: false, max_args: 0) do |event|
  event << "***Info About CahBot:***"
  event << ""
  event << "**What is CahBot?** CB is a small Discord bot with loads of potential."
  event << "**Who made CahBot?** Cah#5153 coded CahBot, with some help from happyzachariah#6121, tons of help from ChewLeKitten#6216 & others"
  event << "**Why does CahBot exist?** One day I was bored so I made a Discord bot. End of story kthxbai"
  event << "**Does CahBot have a server or something?** You bet, https://goo.gl/02ZRK5"
  event << "**u suk a bunnch an u can hardly mak a discord bawt.** Radical, thank you for noticing"
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

bot.command([:reverse, :rev], help_available: false, min_args: 1) do |event, *args|
  "#{args.join(' ')}".reverse
end

bot.command(:userinfo, help_available: false, max_args: 0) do |event|
  event << "**__User Info For You__**"
  event << ""
  event << "**User ID:** `#{event.user.id}`"
  event << "**User Discrim:** `#{event.user.discrim}`"
  event << "**Username:** `#{event.user.name}`"
  event << "**True or False: Are You A Bot?** `#{event.user.current_bot?}`"
  event << "**User Nickname** `#{event.user.nick}`"
  event << "**User Avatar:** https://discordapp.com/api/v6/users/#{event.user.id}/avatars/#{event.user.avatar_id}.jpg"
end

bot.command(:thanks, help_available: false, max_args: 0) do |event|
  event << "Thanks so much to these current Donors:"
  event << "ChewLeKitten#6216 - Tier 1 Donor, Contributor, and an ultra-rad person"
end

bot.command(:update, help_available: false, max_args: 0) do |event|
  event << '**Latest CahBot Update**'
  event << ''
  event << 'No more will I have to do `^eval bot.servers.count` because we now have **^servercount**!'
  event << 'A couple stuff was updated, some commands now have ailiases (^commands and ^cmds return the same thing, ^servcount is the same as ^servercount, etc.).'
  event << 'That\'s about all that was done recently'
end

bot.command([:servercount, :servcount], help_available: false, max_args: 0) do |event|
  event.respond "CahBot is on **#{bot.servers.count}** servers as of now"
end

bot.command(:donate, help_available: false, max_args: 0) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: https://goo.gl/kF20Xw ~~not a virus i swear~~"
end

bot.command(:help, help_available: false, max_args: 0) do |event|
  event << ' woahdude, you looking for help? Well, here\'s what you need to know.'
  event << ' For a list of commands, you can do `^cmds`, for info about CahBot, do `^info`'
end

bot.command(:noot, help_available: false, max_args: 0) do |event|
  event.respond "NOOT https://s-media-cache-ak0.pinimg.com/originals/fe/cb/80/fecb80585eca20163a4d57fa281610b8.gif"
end

bot.command([:cmds, :commands], chain_usable: false, max_args: 0) do |event|
  event << ' Here are all of my commands for you to use!'
  event << ' (upon saying "CB prefix") reminds you the prefix'
  event << ' `^info`: Shows you some info about CB, or something'
  event << ' `^rnumber <Number> <Other Number>`: Gives you a random number'
  event << ' `^help`: Basically tells you to go here'
  event << ' `^cmds`: pulls up this'
  event << ' `^eightball`: Ask the 8ball something'
  event << ' `^userinfo`: Shows some info about you'
  event << ' `^reverse`: Reverses text'
  event << ' `^flip`: Flips a coin, what else did you expect?'
  event << ' `^flop`: Flops a coin, what expect did you else?'
  event << ' `^ping`: Used to show response time'
  event << ' `^servercount`: Returns the number of servers CB is in'
  event << ' `^invite`: Gives you a link to invite me to your own server!'
  event << ' `^die`: Shuts me down, only Cah can use this command'
  event << ' `^roll`: Rolls a number between 1 and 6'
  event << ' `^eval`: Like you don\'t know what eval commands do'
  event << ' `^donate`: Want to donate? That\'s great! This command gives you a link for Donorbox donations'
  event << ' `^update`: Gives you the latest CB update'
  event << ' `^say`: Makes CB say something, you need the manage messages perm tho'
  event << ' `^thanks`: Thanks to these radical donors!'
  event << ' `^feedback <words>`: Want to tell me my bot sucks without going into the CB Server? Well, here you go.'
  event << ' `^noot`: noot'
end

bot.command(:feedback, min_args: 1) do |event, *args|
  if event.channel.pm? == true
    event.respond "Sorry, you can't send feedback via PM just yet!"
  break
  else
    event.message.delete
    bot.send_message(252239053712392192, "New Feedback from `#{event.user.name}`\##{event.user.discriminator}. ID: #{event.user.id}. From the land of `#{event.server.name}` (Server ID: #{event.server.id}).

*#{args.join(' ')}*")
    m = (event.respond "Radical! Feedback sent.")
    sleep 5
    m.delete
  end
end

bot.run
