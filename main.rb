# frozen_string_literal: true

require './class/Purchase'

def print_menu
  print "===== 自動販売機 ===== \n 1. Suicaのチャージ \n 2. ジュースの購入 \n 3. 在庫確認 \n 4. 売上金額確認 \n 5. 終了 \n"
end

def charge_suica(suica)
  print 'チャージ金額を入力してください: '
  amount = gets.chomp.to_i
  begin
    suica.charge_balance(amount)
  rescue StandardError => e
    puts "エラー: #{e.message}"
  end
end

def purchase_drink(suica, purchase)
  puts "現在のSuicaの残高は#{suica.balance}円です。"
  begin
    available_drinks_list = purchase.available_drinks
  rescue StandardError => e
    puts "エラー: #{e.message}"
    return
  end
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
    rescue StandardError => e
      puts "エラー: #{e.message}"
    end
  else
    puts '無効なドリンク番号です。'
  end
end

def show_stock(purchase)
  begin
    available_drinks_list = purchase.available_drinks
  rescue StandardError => e
    puts "エラー: #{e.message}"
    return
  end
  puts '在庫確認:'
  available_drinks_list.each do |drink|
    puts "#{drink.name}: #{drink.stock}本"
  end
end

def show_sales(purchase)
  puts "売上金額: #{purchase.sales}円"
end

def main
  suica = Suica.new
  purchase = Purchase.new

  loop do
    print_menu
    print '選択: '
    choice = gets.chomp.to_i

    case choice
    when 1
      charge_suica(suica)
    when 2
      purchase_drink(suica, purchase)
    when 3
      show_stock(purchase)
    when 4
      show_sales(purchase)
    when 5
      break
    else
      puts '無効な選択です。'
    end
  end
end

main
