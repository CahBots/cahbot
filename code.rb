require 'configatron'
require 'dblruby'
require 'discordrb'
require 'open-uri'
require_relative 'config.rb'

Bot = Discordrb::Commands::CommandBot.new token: configatron.token, client_id: 249_268_393_817_931_776, prefix: ['<@249268393817931776> ', '^'], ignore_bots: true

DBL = DBLRuby.new(configatron.dbl, '249268393817931776')

Dir["#{File.dirname(__FILE__)}/modules/*.rb"].each { |file| require file }

Dir["#{File.dirname(__FILE__)}/modules/*.rb"].each do |wow|
  bob = File.readlines(wow) { |line| line.split.map(&:to_s).join }
  command = bob[0][7..bob[0].length]
  command.delete!("\n")
  command = Object.const_get(command)
  Bot.include! command
  puts "Module #{command} successfully loaded!"
end

Bot.ready do |event|
  sleep 180
  Bot.game = 'Use ^cmds or ^info'
  sleep 180
  Bot.game = "on #{event.bot.servers.count} servers!"
  redo
end

Bot.message(with_text: 'CB prefix') do |event|
  event.respond 'My prefix is `^`. For help, do `^help`'
end

Bot.server_create do |event|
  Bot.send_message(281_280_895_577_489_409, "CahBot just joined `#{event.server.name}` (ID: #{event.server.id}), owned by `#{event.server.owner.distinct}` (ID: #{event.server.owner.id}), the server count is now #{event.bot.servers.count}")
  DBL.stats.servers = event.bot.servers.count
end

Bot.server_delete do |event|
  Bot.send_message(281_280_895_577_489_409, "CahBot just left `#{event.server.name}` (ID: #{event.server.id}), the server count is now #{event.bot.servers.count}")
  DBL.stats.servers = event.bot.servers.count
end

Bot.run
