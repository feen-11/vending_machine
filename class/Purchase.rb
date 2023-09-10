# frozen_string_literal: true

require_relative 'Drink'
require_relative 'Suica'

# Purchaseクラスは購入に関する機能を提供します。
class Purchase
  attr_reader :sales

  def initialize
    @drinks = [Drink.new('ペプシ', 150), Drink.new('モンスター', 230), Drink.new('いろはす', 120)]
    @sales = 0
  end

  def available_drinks
    @drinks.select { |drink| drink.stock.positive? }
  end

  def judge_purchase(suica, drink)
    raise '購入できません。Suicaの残高が足りません。' if (suica.balance) < (drink.price)
  end

  def add_sales(price)
    change_sales(sales + price)
  end

  def purchase_process(suica, drink)
    judge_purchase(suica, drink)
    drink.reduce_stock
    add_sales(drink.price)
    suica.reduce_balance(drink.price)
    puts "#{drink.name}を購入しました。現在の売上金額は#{sales}円です。"
  end

  private

  def change_sales(value)
    @sales = value
  end
end
