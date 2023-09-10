# frozen_string_literal: true

require './class/Purchase'

suica = Suica.new
puts "スイカの残高は#{suica.balance}円です。"

purchase = Purchase.new
puts "現在の売上高は#{purchase.sales}円です。"

def main
  suica = Suica.new
  purchase = Purchase.new

  loop do
    puts '==== 自動販売機 ===='
    puts '1. Suicaのチャージ'
    puts '2. ジュースの購入'
    puts '3. 在庫確認'
    puts '4. 売上金額確認'
    puts '5. 終了'
    print '選択: '
    choice = gets.chomp.to_i

    case choice
    when 1
      print 'チャージ金額を入力してください: '
      amount = gets.chomp.to_i
      begin
        suica.charge_balance(amount)
      rescue => e
        puts "エラー: #{e.message}"
      end
    when 2
      puts "現在のSuicaの残高は#{suica.balance}円です。"
      puts '購入可能なドリンク一覧:'
      purchase.available_drinks.each_with_index do |drink, index|
        puts "#{index + 1}. #{drink.name} (#{drink.price}円)"
      end
      print '購入したいドリンク番号を選択してください: '
      drink_number = gets.chomp.to_i
      selected_drink = purchase.available_drinks[drink_number - 1]

      if selected_drink
        begin
          purchase.purchase_process(suica, selected_drink)
        rescue => e
          puts "エラー: #{e.message}"
        end
      else
        puts '無効なドリンク番号です。'
      end
    when 3
      puts '在庫確認:'
      purchase.available_drinks.each do |drink|
        puts "#{drink.name}: #{drink.stock}本"
      end
    when 4
      puts "売上金額: #{purchase.sales}円"
    when 5
      break
    else
      puts '無効な選択です。'
    end
  end
end

main

