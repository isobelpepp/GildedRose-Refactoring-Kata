class GildedRose

  EXCEPTIONS = ['Sulfuras, Hand of Ragnaros', 'Backstage passes to a TAFKAL80ETC concert', 'Aged Brie', 'Conjured']

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros'
        if regular_item?(item.name)
          process_regular_item(item)
        elsif item.name == 'Aged Brie'
          process_aged_brie(item)
        elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
          process_backstage_passes(item)
        elsif item.name == 'Conjured'
          process_conjured_item(item)
        end
      end
    end
  end

  def regular_item?(name)
    EXCEPTIONS.include?(name) ? false : true
  end

  def process_regular_item(item)
    if item.quality.positive?
      item.quality -= 1
      item.quality -= 1 if item.sell_in.negative?
    end
    item.sell_in -= 1
  end

  def process_aged_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end

  def process_backstage_passes(item)
    if item.quality < 50
      item.quality += 1
      item.quality += 1 if item.sell_in < 11
      item.quality += 1 if item.sell_in < 6
    end
    item.quality = 0 if item.sell_in.negative?
    item.sell_in -= 1
  end

  def process_conjured_item(item)
    if item.quality.positive?
      item.quality -= 2
      item.quality -= 2 if item.sell_in < 0
      item.quality = 0 if item.quality.negative?
    end
    item.sell_in -= 1
  end
end
