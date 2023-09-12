# frozen_string_literal: true

# Suicaクラスは電子マネーの機能を提供します。
class Suica
  attr_reader :balance

  def initialize
    @balance = 500
  end

  def charge_balance(money)
    money = money.to_i
    raise '最低チャージ金額は100円です。' if money < 100

    change_balance(balance + money)
    puts "#{money}円チャージしました。現在の残高は#{balance}円です。"
  end

  def reduce_balance(drink)
    change_balance(balance - drink)
  end

  private

  def change_balance(val)
    @balance = val
  end
end
