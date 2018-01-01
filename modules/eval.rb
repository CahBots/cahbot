module Eval
  extend Discordrb::Commands::CommandContainer

  command(:eval, help_available: false) do |event, *code|
    if event.user.id == 228_290_433_057_292_288
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
end
