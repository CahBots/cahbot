require 'discordrb'
require 'configatron'
require 'open-uri'
require_relative 'config.rb'

bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 249268393817931776, prefix: ['<@249268393817931776> ', '^'], ignore_bots: true

bot.ready do |event|
  sleep 180
  bot.game = "Use ^cmds or ^info"
  sleep 180
  bot.game = "on #{bot.servers.count} servers!"
  redo
end

bot.server_create do |event|
  bot.send_message(281280895577489409, "CahBot just joined `#{event.server.name}` (ID: #{event.server.id}), owned by `#{event.server.owner.distinct}` (ID: #{event.server.owner.id}), the server count is now #{bot.servers.count}")
end

bot.server_delete do |event|
  bot.send_message(281280895577489409, "CahBot just left `#{event.server.name}` (ID: #{event.server.id}), the server count is now #{bot.servers.count}")
end

bot.command(:die, help_available: false) do |event|
  if event.user.id == 228290433057292288
    bot.send_message(event.channel.id, 'CahBot is shutting down')
    exit
  else
    "Hey, you can't do that!"
  end
end
bot.command :leave do |event, id|
  if event.user.id == 228290433057292288
    bot.server(id.to_i).leave
  else
   "aaaaa"
  end
end

bot.command(:eval, help_available: false) do |event, *code|
  if event.user.id == 228290433057292288
    begin
      event << 'Eval Complete!'
      event << ''
      event << "Output: ```#{eval code.join(' ')} ```"
    rescue => e
      event << 'Eval Failed!'
      event << ''
      event << "Output: ```#{e} ```"
    end
  else
    'Sorry, only Cah can eval stuff'
  end
end

bot.command(:restart, help_available: false) do |event|
  if (event.user.id == 228290433057292288 || 348607473546035200)
    begin
      event.respond ['Into the ***fuuuutttttuuuuurrrreeee***', 'Please wait...', 'How about n—', 'Can do :thumbsup::skin-tone-1:', 'Pong! Hey, that took... Oh wait, wrong command', 'Ask again at a later ti—'].sample
      exec('bash restart.sh')
    end
  else
    'Sorry, only Cah can update me'
  end
end

bot.command(:set, help_available: false) do |event, action, *args|
  if event.user.id == 228290433057292288
    case action
    when 'avatar'
      open("#{args.join(' ')}") { |pic| event.bot.profile.avatar = pic }
    when 'username'
      name = "#{args.join(' ')}"
      event.respond "Username set to `#{bot.profile.username = name}`"
    when 'game'
      bot.game = "#{args.join(' ')}"
      event.respond 'GAME SET!'
    when 'status'
      online = bot.on
      idle = bot.idle
      invis = bot.invisible
      dnd = bot.dnd
      eval args.join; "Status Changed!"
    else
      'I don\'t know what to do!'
    end
  else
    'Sorry, only Cah can set stuff'
  end
end

bot.command(:ban, help_available: false, required_permissions: [:ban_members], permission_message: 'Heh, sorry, but you need the Ban Members permission to use this command', max_args: 1, min_args: 1, usage: '^ban <mention>') do |event, *args|
  bot_profile = bot.profile.on(event.server)
  can_do_the_magic_dance = bot_profile.permission?(:ban_members)
  if can_do_the_magic_dance == true
    if !event.message.mentions.empty?
      begin
        mention = bot.parse_mention("#{args.join}").id
        event.server.ban("#{mention}", message_days = 7)
        event.respond ["<@#{mention}> has been beaned, the past 7 days of messages from them have been deleted", "<@#{mention}> has been banned, the past 7 days of messages from them have been deleted"]
      rescue => e
        event.respond "The user you are trying to ban has a role higher than/equal to me. If you believe this is a mistake, report this to the CB Server"
        bot.send_message(281280895577489409, "ERROR on server #{event.server.name} (ID: #{event.server.id}) for command `^ban`, `#{e}`")
      else
        event.respond "Sorry, but I do not have the \"Ban Members\" permission"
      end
    else
      event.respond "Sorry, but you need to mention the person you want to ban"
    end
  end
end

bot.command(:ping, help_available: false, max_args: 0) do |event|
  m = event.respond('Pinging!')
  m.edit "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command(:pingnoedit, help_available: false, max_args: 0) do |event|
  event.respond "Pong! Hey, that took #{((Time.now - event.timestamp) * 1000).to_i}ms."
end

bot.command([:eightball, :eball, :'8ball'], help_available: false, min_args: 1) do |event|
  event.respond ["Sources say... Yeah", "Sources say... Nah", "Perhaps", "As I see it, yes", "As I see it, no", "If anything, probably", "Not possible", "Ask again at a later time", "Say that again?", "lol idk", "Probably not", "woahdude", "[object Object]", "Undoubtfully so", "I doubt it", "Eh, maybe"].sample
end

bot.command(:roll, help_available: false, max_args: 0) do |event|
  h = event.respond '**Rolling Dice!**'
  sleep 2
  h.edit "And you got a... **#{rand(1..6)}!**"
end

bot.command(:flip, help_available: false, max_args: 0) do |event|
  event.respond ["woahdude, you got **Heads**", "woahdude, you got **Tails**", "You got **heads**", "You got **tails**"].sample
end

bot.command(:flop, help_available: false, max_args: 0) do |event|
  event.respond ["Oops, the coin flipped so high it didn't come back down", "The coin multiplied and landed on both", "The coin... disappeared", "Pong! It took **#{((Time.now - event.timestamp) * 1000).to_i}ms** to ping the coin", "And you got a... **#{rand(1..6)}!** wait thats not how coins work", "Perhaps you could resolve your situation without relying on luck", "noot", "[Witty joke concerning flipping a coin]", "[BOTTOM TEXT]"].sample
end

bot.command(:info, help_available: false, max_args: 0) do |event|
  event << "***Info About CahBot:***"
  event << ""
  event << "**What is CahBot?** CB is a small Discord bot with loads of potential."
  event << "**Who made CahBot?** Cah#5153 coded CahBot, with some help from happyzachariah#6121, tons of help from Chew#6216 & others"
  event << "**Why does CahBot exist?** One day I was bored so I made a Discord bot. End of story kthxbai"
  event << "**Does CahBot have a server or something?** You bet, https://discord.gg/cWmvfmz"
  event << "**u suk a bunnch an u can hardly mak a discord bawt.** Radical, thank you for noticing"
end

bot.message(with_text: 'CB prefix') do |event|
  event.respond "My prefix is `^`. For help, do `^help`"
end

bot.command(:rnumber, help_available: false, min_args: 2, max_args: 2) do |event, min, max|
  rand(min.to_i..max.to_i)
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
  if (event.user.nick != nil)
    event << "**User Nickname:** `#{event.user.nick} `"
  end
  if (event.user.game != nil)
    event << "**User Game:** `#{event.user.game} `"
  end
  event << "**User Avatar:** https://cdn.discordapp.com/avatars/#{event.user.id}/#{event.user.avatar_id}.webp?size=1024"
end

bot.command([:servercount, :servcount], help_available: false, max_args: 0) do |event|
  event.respond "CahBot is on **#{bot.servers.count}** servers as of now"
end

bot.command(:donate, help_available: false, max_args: 0) do |event|
  event.respond "Hi #{event.user.name}, click here for donations: <https://goo.gl/QBvB7N> ~~*not a virus i swear*~~"
end

bot.command(:help, help_available: false, max_args: 0) do |event|
  event << ' woahdude, you looking for help? Well, here\'s what you need to know.'
  event << ' For a list of commands, you can do `^cmds`, for info about CahBot, do `^info`'
end

bot.command(:noot, help_available: false, max_args: 0) do |event|
  event.respond "NOOT https://s-media-cache-ak0.pinimg.com/originals/fe/cb/80/fecb80585eca20163a4d57fa281610b8.gif"
end

bot.command([:cmds, :commands], chain_usable: false, max_args: 0) do |event|
  event << 'Here are all of my commands for you to use!'
  event << '*__Cah\'s Commands__*'
  event << '`^restart`: Pulls that fresh code and runs it'
  event << '`^die`: Kills the bot, without pulling any code or anything'
  event << '`^eval`: Like you don\'t know what eval commands do'
  event << '`^set <avatar|username|game|status> <args>`: Sets stuff'
  event << ''
  event << '*__Moderation Commands (in the works)__*'
  event << '`^ban <mention>`: Bans the user mentioned and deletes the past 7 days of messages from them'
  event << '`^say`: Makes CB say something, you need the manage messages perm tho ~~yes I know it\'s not much of a moderation command shut up~~'
  event << ''
  event << '*__Fun Commands/Other Commands/Things I Was Too Lazy To Group__*'
  event << '(upon saying "CB prefix") reminds you the prefix'
  event << '`^info`: Shows you some info about CB, or something'
  event << '`^rnumber <Number> <Other Number>`: Gives you a random number'
  event << '`^help`: Basically tells you to go here'
  event << '`^cmds`: pulls up this'
  event << '`^eightball`: Ask the 8ball something'
  event << '`^userinfo`: Shows some info about you'
  event << '`^reverse`: Reverses text'
  event << '`^flip`: Flips a coin, what else did you expect?'
  event << '`^flop`: Flops a coin, what expect did you else?'
  event << '`^ping`: Used to show response time'
  event << '`^servercount`: Returns the number of servers CB is in'
  event << '`^invite`: Gives you a link to invite me to your own server!'
  event << '`^roll`: Rolls a number between 1 and 6'
  event << '`^donate`: Want to donate? That\'s great! This command gives you a link for Patreon donations'
  event << '`^feedback <words>`: Sends your feedback to the CB Server'
  event << '`^trello`: The Trello board, woahdude'
  event << '`^noot`: noot (don\'t ask I didn\'t write this)'
  event << ''
  event << 'As always, if you find a horrible bug, report it in the CB Server <https://discord.gg/cWmvfmz>'
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

bot.command([:subscribe, :sub]) do |event|
  if event.channel.pm? == true
    event.respond "I can not give you a role in PMs! That would be silly (and impossible)!"
    break
  end
  to_add = event.server.roles.find { |role| role.name == 'Sub' }
  if event.server.id == 252196054101917696
    if event.user.role?(to_add) == false
      event.user.add_role(to_add)
      event.message.delete
      m = event.respond "Nice, subscribed successfully!"
      bot.channel(252260490028384258).send_embed do |e|
        e.title = "**New Subscriber**"
        e.color = 555555
        e.timestamp = Time.now
        e.footer = { icon_url: "#{event.author.avatar_url}", text: "#{event.author.name}##{event.author.discriminator}" }
      end
      sleep 3
      m.delete
    else
      event.message.delete
      e = event.respond "You already have the role!"
      sleep 3
      e.delete
    end
  else
    event.respond 'This command can only be used in the CB Server'
  end
end

bot.command([:unsubscribe, :unsub]) do |event|
  if event.channel.pm? == true
    event.respond "I can not take a role in PMs! That would be silly (and impossible)!"
    break
  end
  to_add = event.server.roles.find {|role| role.name == 'Sub'}
  if event.server.id == 252196054101917696
    if event.user.role?(to_add) == true
      event.user.remove_role(to_add)
      event.message.delete
      m = event.respond "You've unsubscribed from updates!"
      bot.send_message(252260490028384258, "#{event.user.name}\##{event.user.discrim} is no longer a subscriber!")
      sleep 3
      m.delete
    else
      event.message.delete
      e = event.respond "You don't have the role!"
      e.delete
    end
  else
    event.respond 'This command can only be used in the CB Server'
  end
end

bot.command(:accept, in: '<#269981476135632896>') do |event|
  if event.server.id == 252196054101917696
    if event.channel.id == 269981476135632896
      event.message.delete
      to_add = event.server.roles.find {|role| role.name == 'Members'}
      if event.user.role?(to_add) == false
        event.user.add_role(to_add)
        event.user.pm("Thank you for reading the rules and information, enjoy your stay!")
      else
        event.respond "You must already have the member role, or an error has occured. Please notify cah or chew."
      end
    else
      break
    end
  else
    event.respond 'This command can only be used in the CB Server'
  end
end

bot.run
