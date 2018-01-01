module RNumber
  extend Discordrb::Commands::CommandContainer

  command(:rnumber, help_available: false, min_args: 2, max_args: 2) do |_event, min, max|
    rand(min.to_i..max.to_i)
  end
end
