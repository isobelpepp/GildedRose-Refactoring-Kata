class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != 'Sulfuras, Hand of Ragnaros'
        if is_regular_item(item.name)
          process_regular_item(item)
        elsif item.name == 'Aged Brie'
          process_aged_brie(item)
        else
          if item.quality < 50
            item.quality = item.quality + 1
            if item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.sell_in < 11
                if item.quality < 50
                  item.quality = item.quality + 1
                end
              end
              if item.sell_in < 6
                if item.quality < 50
                  item.quality = item.quality + 1
                end
              end
            end
          end
        end
        if item.name === "Backstage passes to a TAFKAL80ETC concert"
          item.sell_in = item.sell_in - 1
        end
        if item.sell_in < 0
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        end
      end
    end
  end

  def is_regular_item(name)
    if name == 'Aged Brie' || name == 'Backstage passes to a TAFKAL80ETC concert' || name == 'Sulfuras, Hand of Ragnaros'
      return false
    else 
      return true
    end
  end

  def process_regular_item(item)
    if item.quality > 0
      item.quality -= 1
      item.quality -= 1 if item.sell_in < 0 
    end
    item.sell_in -= 1
  end

  def process_aged_brie(item)
    item.sell_in -= 1
    item.quality += 1 if item.quality < 50
  end
end
