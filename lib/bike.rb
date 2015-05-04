class Bike
  def initialize
    working
  end

  def working
    @broken = false
  end

  def broken?
    @broken
  end

  def report_broken
    @broken = true
  end
end
