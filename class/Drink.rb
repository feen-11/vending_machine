# frozen_string_literal: true

# Drinkクラスはドリンクに関する機能を提供します。
class Drink
  attr_reader :name, :price, :stock

  def initialize(name, price)
    @name = name
    @price = price
    @stock = 5
  end

  def reduce_stock
    change_stock(stock - 1) if stock.positive?
  end

  private

  def change_stock(val)
    @stock = val
  end
end
