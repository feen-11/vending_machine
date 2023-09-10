# frozen_string_literal: true

class Suica
  def initialize
    @balance = 500
  end

  def balance
    @balance
  end

  def charge_balance(money)
    money = money.to_i
    raise '最低チャージ金額は100円です。' if money < 100
    set_balance(balance + money)
    puts "#{money}円チャージしました。現在の残高は#{balance}円です。"
  end

  def reduce_balance(drink)
    set_balance(balance - drink)
  end

  private

  def set_balance(val)
    @balance = val
  end
end
