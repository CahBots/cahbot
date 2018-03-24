require 'configatron'
require 'discordrb'
require 'open-uri'
require_relative 'config.rb'

Bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 249_268_393_817_931_776, prefix: ['<@249268393817931776> ', '^'], ignore_bots: true

Dir["#{File.dirname(__FILE__)}/modules/*.rb"].each { |file| require file }

Modules = [Ban, CahBotServer, Commands, Die, Donate, EBall, Eval, Feedback, FlipFlop, Help, Info, Invite, Leave, Noot, Ping, Restart, Reverse, RNumber, Roll, Say, ServerCount, SetStuff, UserInfo].freeze

Modules.each do |mod|
  Bot.include! mod
  puts "Module #{mod} successfully loaded!"
end

Bot.ready do |_event|
  sleep 180
  Bot.game = 'Use ^cmds or ^info'
  sleep 180
  Bot.game = "on #{bot.servers.count} servers!"
  redo
end

Bot.message(with_text: 'CB prefix') do |event|
  event.respond 'My prefix is `^`. For help, do `^help`'
end

Bot.server_create do |event|
  Bot.send_message(281_280_895_577_489_409, "CahBot just joined `#{event.server.name}` (ID: #{event.server.id}), owned by `#{event.server.owner.distinct}` (ID: #{event.server.owner.id}), the server count is now #{event.bot.servers.count}")
end

Bot.server_delete do |event|
  Bot.send_message(281_280_895_577_489_409, "CahBot just left `#{event.server.name}` (ID: #{event.server.id}), the server count is now #{event.bot.servers.count}")
end

Bot.run
