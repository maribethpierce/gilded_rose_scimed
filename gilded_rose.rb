class GildedRose
  attr_accessor :items
  def initialize(items)
    @items = items
  end

  def update_inventory
    @items.each do |item|
      item[0].update_quality
      item[0].sell_in -= 1
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality
    if self.quality >= 2
      sell_in > 0 ? decrement_1 : decrement_2
    else
      self.quality = 0
    end
    upper_limit
  end

  def decrement_1
    self.quality -= 1
  end

  def decrement_2
    self.quality -= 2
  end

  def upper_limit
    self.quality > 50 ? self.quality = 50 : self.quality
  end

end

class AgedBrie < Item

  def update_quality
    self.quality < 50 ? self.quality += 1 : self.quality
  end

end

class LegendaryItem < Item

  def update_quality
    self.quality = 80
    self.sell_in = 0
  end

end

class BackstagePasses < Item

  def update_quality
    self.sell_in -= 1
    self.sell_in == 0 ? self.quality = 0 : increment
  end

  def increment
    if self.sell_in < 6
      increment_3
    elsif self.sell_in < 11
      increment_2
    else
      increment_1
    end
  end

  def increment_1
    self.quality += 1
  end

  def increment_2
    self.quality += 2
  end

  def increment_3
    self.quality += 3
  end

end

class ConjuredItem < Item

  def update_quality
    self.sell_in -= 1
    self.quality >= 2 ? self.quality -= 2 : self.quality = 0
  end

end
