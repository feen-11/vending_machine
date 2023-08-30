class Suica
  attr_accessor :digipot

  def initialize(digipot=500)
    @digipot = digipot
  end

  def show_digipot
    self.digipot
  end

  def charge_digipot(charge)
      raise "最低チャージ金額は100円です。" if charge < 100
      @digipot += charge
  end

end


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

class Purchase

  def initialize(sales=0)
    @sales = sales
  end

end

