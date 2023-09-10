# frozen_string_literal: true

require_relative 'Drink'
require_relative 'Suica'

class Purchase

  def initialize(sales=0)
    @drinks = [Drink.new("ペプシ", 150), Drink.new("モンスター", 230), Drink.new("いろはす", 120)]
    @sales = sales
  end

  def sales
    @sales
  end

  def available_drinks
    @drinks.select { |drink| drink.stock > 0 }
  end
  
  def judge_purchase(suica, drink)
    raise '購入できません。Suicaの残高が足りません。' if (suica.balance) < (drink.price)
  end
  
  def add_sales(price)
    set_sales(sales + price)
  end
  
  def purchase_process(suica, drink)
    self.judge_purchase(suica,drink)
    drink.reduce_stock
    self.set_sales(drink.price)
    suica.reduce_balance(drink.price)
    puts "#{drink.name}を購入しました。現在の売上金額は#{sales}円です。"
  end

  private

  def set_sales(value)
    @sales = value
  end
  
end

