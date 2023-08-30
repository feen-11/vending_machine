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
