class Drink

  attr_accessor :name, :price, :stock

  def initialize(name='ペプシ', price=150, stock=5)
    @name = name
    @price = price
    @stock = stock
  end

  def show_stock
    self.stock
  end

end