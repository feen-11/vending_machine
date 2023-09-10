# frozen_string_literal: true

class Drink

  def initialize(name, price)
    @name = name
    @price = price
    @stock = 5
  end

  def name
    @name
  end

  def price
    @price
  end

  def stock
    @stock
  end
  
  def reduce_stock
    set_stock(stock - 1) if stock > 0
  end

  private

  def set_stock(val)
    @stock = val
  end

end
