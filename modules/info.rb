module Info
  extend Discordrb::Commands::CommandContainer

  command(:info, help_available: false, max_args: 0) do |event|
    event << '***Info About CahBot:***'
    event << ''
    event << '**What is CahBot?** CB is a small Discord bot with loads of potential.'
    event << "**Who made CahBot?** #{Bot.user(228290433057292288).distinct} coded CahBot, with some help from #{Bot.user(133570779576139776).distinct}, tons of help from #{Bot.user(116013677060161545).distinct} & others"
    event << '**Why does CahBot exist?** One day I was bored so I made a Discord bot. End of story kthxbai'
    event << '**Does CahBot have a server or something?** You bet, https://discord.gg/cWmvfmz'
    event << '**u suk a bunnch an u can hardly mak a discord bawt.** Radical, thank you for noticing'
  end
end
