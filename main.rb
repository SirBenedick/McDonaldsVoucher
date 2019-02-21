require "selenium-webdriver"
require_relative "config"
require_relative "helper"
require 'telegram/bot'

voucher_recived =[]

Telegram::Bot::Client.run(Config::TOKEN) do |bot|
  bot.listen do |message|
    puts "#{message.chat.id}: #{message}"
    case message.text
    when '/start'
        new_message = "Hallo, #{message.from.first_name},\nUm einen Code einzugeben schreibe /gutschein"
        bot.api.send_message(chat_id: message.chat.id, text: new_message)
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/gutschein'
        voucher_recived[message.chat.id] = true
        bot.api.send_message(chat_id: message.chat.id, text: "Bitte den Code in diesem Format zusenden \nXXXX-XXXX-XXXX")
    else 
        if voucher_recived[message.chat.id]
            bot.api.send_message(chat_id: message.chat.id, text: "Gutschein für Code: #{message.text} wird generiert.\nDies dauert einwenig, habe gedult.")
            voucher = Helper.rateAndExtract message.text
            bot.api.send_message(chat_id: message.chat.id, text: voucher)
            voucher_recived[message.chat.id] = false
            open('myfile.out', 'a') do |f|
                f.puts "#{Time.now}, #{message.chat.id}, #{message.from.first_name}, #{message.text}, #{voucher}"
              end
        else
            bot.api.send_message(chat_id: message.chat.id, text: "Um einen Code zusenden /gutschein")
        end
    end
  end
end