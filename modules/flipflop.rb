module FlipFlop
  extend Discordrb::Commands::CommandContainer

  command(:flip, help_available: false, max_args: 0) do |event|
    event.respond ['woahdude, you got **Heads**', 'woahdude, you got **Tails**', 'You got **heads**', 'You got **tails**'].sample
  end

  command(:flop, help_available: false, max_args: 0) do |event|
    event.respond ["Oops, the coin flipped so high it didn't come back down", 'The coin multiplied and landed on both', 'The coin... disappeared', "Pong! It took **#{((Time.now - event.timestamp) * 1000).to_i}ms** to ping the coin", "And you got a... **#{rand(1..6)}!** wait thats not how coins work", 'Perhaps you could resolve your situation without relying on luck', 'noot', '[Witty joke concerning flipping a coin]', '[BOTTOM TEXT]'].sample
  end
end
